classdef Pathologist 
% Pathologist File path utility class
%     
%     PathO = Pathologist( pathIn ) ;
%
% Recasts the array of file paths `pathIn` as a `Pathologist` object,
% containing simple+convenient methods for handling paths to files and folders. 
%
% Since a path designation in MATLAB can take one of three forms (char-,
% string-, or cellstr-array), a primary purpose the class is merely to provide
% a convenient means of handling the different implementations. Namely, a set
% of input paths will always, first, be typecast as a string and stored as the
% property `data`. After processing via any `Pathologist` methods, paths are
% returned in the form of their input (see Pathologist.returnasinput).
%
% **NOTE** The name `pathtool` already being taken by a builtin MATLAB
% function, in keeping with the `Doc. Md.` theme and the unfortunately current
% zeitgeist due to COVID-19, "Pathologist" seems an appropriate moniker.

properties( Access=private )

    % Input data-type (aka 'class') 
    typeIn(1,1) string {mustBeMember(typeIn, ["string" "char" "cell"])} = "char" ;

    sizeIn = 1

end

properties

    %TODO: data can be private or at least hidden once subsasgn/subsref both work...

    % Path data: real or fictitious files or folders
    data {valid.mustBeString} = "./" ;

    % Sets the return datatype (class) of path info as "string" "char" or "cell"
    % 
    % (Default is whatever data type was used to initialize the object.) 
    typeOut(1,1) string {mustBeMember(typeOut, ["string" "char" "cell"])} = "char" ;
    
end

properties( Dependent )

    % list of files among Path.data
    files ;
    
    % list of folders among Path.data
    folders ;

    % subfolders of each folder element of Path.data
    subfolders ;
    
    % Number of input paths
    nPaths ;

    % Path(s) to immediate parent folder(s) (single level)
    % Main doc. entry (for now?): parent.m
    parentDir ;

    % Deepest common parent folder (the "fork")
    % `if Path.nPaths == 1, Path.baseDir = Path.parentDir`
    % Main doc. entry (for now?): parent.m
    baseDir(1,:) ;

end

% =========================================================================
% =========================================================================    
methods
% =========================================================================    
function Path = Pathologist( pathIn )
    
    if nargin == 0
        return ;
    end

    Path.typeIn  = string( class( pathIn ) ) ;
    Path.typeOut = Path.typeIn ;
    Path.sizeIn  = size( pathIn ) ;
    Path.data    = Pathologist.typecast( pathIn, "string" ) ;

end
% =========================================================================    
function [baseDir] = get.baseDir( Path )

    baseDir = retracepath( Path.data(:) ) ;
    baseDir = Path.returnasinput( baseDir ) ;

    %% Retrace path 
    % NOTE this doesn't need to be a function if it stays here, but might be
    % more sensible as a static function...) 
    function [baseDir] = retracepath( pathIn )
    % Reassemble the shared path one sub dir at at time, starting at the root;
    % return where it diverges. 
        baseDir     = unique( extractBefore( Path.data, 2 ) ) ; % presumably == filesep
        nParentsMin = min( count( Path.data, filesep ) ) ;

        if numel( baseDir ) ~= 1 % nothing in common :(
            baseDir = "?" ; 
            return ;
        end

        iParent       = 1 ;
        pathRemaining = Path.data ;

        while all( strlength( pathRemaining)>0 ) && ( iParent < nParentsMin )

            iParent = iParent + 1 ;

            [subDir, pathRemaining] = strtok( pathRemaining, filesep ) ;
            uniqueSubDir            = unique( subDir ) ;

            if numel( uniqueSubDir ) == 1 
                baseDir = fullfile( baseDir, uniqueSubDir ) ;
            
            else % path forked at iParent-1; exit while
                pathRemaining = "" ;
            end
        end

    end % retracepath()

end
% =========================================================================    
function [files] = get.files( Path )

    files = Path.data( Path.isfile ) ;

end
% =========================================================================    
function [folders] = get.folders( Path )

    folders = Path.data( Path.isfolder ) ;

end
% =========================================================================    
function [subfolders] = get.subfolders( Path )

    if all( Path.isfolder == false )
        subfolders = string([]) ;
        return ; 
    end

    folders = Path.folders ; 
    subfolders = string( [] ) ;
%TODO: change call so Path.subfolders(i) returns the column vector of subfolders in Path.folders(i)...
    if ~isempty( folders )  
        for iDir = 2 : numel( folders ) 
            subfoldersiDir = Path.mapdirectorytree( folders(iDir), false, false ) 
            subfolders     = [ subfolders ; subfoldersiDir ] ; 
        end
    end

end
% =========================================================================    
function [nPaths] = get.nPaths( Path )
    
    nPaths = numel( Path.data ) ;
end
% =========================================================================    
function [parentDir] = get.parentDir( Path )
    
    %% Get parent directories (single level)
    if Path.nPaths == 1
        parentDir = fileparts( Path.data ) ;
        
        % 2x if input was of the form: '.../folder/'
        if endsWith( Path.data, filesep ) 
            parentDir = fileparts( parentDir ) ;
        end
    else
        parentDir = arrayfun( @fileparts, Path.data ) ;
    end

    parentDir = returnasinput( Path, parentDir ) ;

end
% =========================================================================    
function [isValid] = isvalid( Path )
%ISVALID Returns true for elements of Path.data that refer to files or folders
%
% `Path.isValid = [ Path.isfile | Path.isfolder ]`

    isValid = [ Path.isfile | Path.isfolder ] ;

end
% =========================================================================    

end % methods
% =========================================================================    
% =========================================================================    

methods % overloaded MATLAB methods
% =========================================================================    
function [isFilepath] = isfile( Path )
%ISFOLDER Overloaded MATLAB function, returnArg = isfile( Path.data ) ;

    isFilepath = isfile( Path.data ) ;

end
% =========================================================================    
function [isDir] = isfolder( Path )
%ISFOLDER Overloaded MATLAB function, returnArg = isfolder( Path.data ) ;

    isDir = isfolder( Path.data ) ;

end
% =========================================================================    
function [mExist] = exist( Path )
%EXIST Overloaded MATLAB function, returnArg = arrayfun( @exist, Path.data ) ; 

    mExist = arrayfun( @exist, Path.data ) ; 
    
end
% =========================================================================    
function [folder, name, ext] = fileparts( Path )
%FILEPARTS Overloaded MATLAB function: [filepath,name,ext] = arrayfun( @fileparts, Path.data ) ;

    [folder, name, ext] = arrayfun( @fileparts, Path.data ) ;

end
% =========================================================================    

end
% =========================================================================    
% =========================================================================    
methods (Hidden) % (hidden) overloaded MATLAB methods
% =========================================================================    
% function Path = subsasgn(Path, S, pathIn)
%SUBSREF Overloaded MATLAB function
%
%     if strcmp( S(1).type, '()' )
%         switch class( pathIn )
%             case 'char'
%                 Path.data(S.subs{:}) = deblank( string( pathIn ) ) ;
%                 return
%             case 'cell'
%                 assert( iscellstr(pathIn), 'Value must be a string, char, or cellstr')
%                 Path.data(S.subs{:}) = deblank( string( pathIn ) ) ;
%                 return 
%             case 'string'
%                 Path.data(S.subs{:})= pathIn ;
%             otherwise
%                 error('Value must be a string, char, or cellstr')
%         end
%
%     else % Call built-in for any other case
%         Path = builtin('subsasgn', Path, S, pathIn);
%     end
% end
% % =========================================================================    
function pathOut = subsref(Path, S)
%SUBSREF Overloaded MATLAB function
    if isequal(Path,[])
        Path = Pathologist.empty;
    end

    switch S(1).type
        case '()'
            pathOut = Path.data(S.subs{:}) ;
        case '.' 
            % Call built-in for any other case
            pathOut = builtin('subsref',Path,S) ;
        otherwise
            % pathOut = cell2mat( builtin('subsref',Path,S) ) ;
            pathOut = builtin('subsref',Path,S) ;
            % pathOut{:} = builtin('subsref',Path,S); 
        %    switch S(1).subs
        %       case 'plot'
        %          % Reference to A.x and A.y call built-in subsref
        %          B = plot(A.x,A.y);
        %       otherwise
        %          % Enable dot notation for all properties and methods
        %          B = A.(S.subs);
     end
     
end
% =========================================================================    

end
% =========================================================================    
% =========================================================================    
methods( Access=private )
% =========================================================================    
function [varargout] = returnasinput( Path, varargin ) 
% RETURNASINPUT Resize and recast a path value to correspond with user input
%    
%     [pathOut] = returnasinput( Path )
%     [pathOut] = returnasinput( Path, pathIn )
%     [pathOut1, pathOut2, ...] = returnasinput( Path, pathIn1, pathIn2,... )
%
% Reshapes `pathIn` according to `Path.sizeIn` when the 2 have the same number
% of elements and recasts it as `Path.typeIn` to return `pathOut`.
%
% When called with the single argument, `pathIn` is assigned the value of
% `Path.data`. 
%
% When called with > 2 inputs, resizing + recasting is applied successively to
% define the respective returns.

    if nargin == 1
        pathIn = Path.data ;
    elseif nargin == 2
        pathIn = varargin{1} ;
        if numel( pathIn ) > 1
            if strcmp( Path.typeIn, 'char' )
                pathIn = reshape( pathIn, [Path.sizeIn(1) 1 Path.sizeIn(3:end)] ) ;
            else
                pathIn = reshape( pathIn, Path.sizeIn ) ; 
            end
        end

        varargout{1} = Path.typecast( pathIn, Path.typeIn ) ;

    elseif nargin > 2
        for iP = 1 : numel( varargin )
            varargout{iP} = Path.returnasinput( varargin{iP} ) ;
        end
    end

end
% =========================================================================    

end % private methods
% =========================================================================    
% =========================================================================    
methods( Static )
    %..... 
    [pathOut, pathType] = abs( pathIn )
    %..... 
    [txtOut] = typecast( txtIn, castAs )
    %..... 
    [dirs]   = mapdirectorytree( baseDir, isReturnRelative, isExcludingHidden )
    %..... 
    [Info]  = whatr( baseDir, isExcludingHidden )
end
% =========================================================================    
% =========================================================================    

% =========================================================================    
%
end % classdef Pathologist

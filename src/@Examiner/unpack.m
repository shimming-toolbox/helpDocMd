function [pkgs, pkgPaths] = unpack( mPath )
%UNPACK Return a filepath's package (namespace)
%        
%    [pkg, pkgPath] = Examiner.unpack( mPath )
%
% Given `mPath`(a single file-system path), `unpack` returns 2 string-vectors:
% 
%—`pkgs`: Names of the (enclosing) packages. (If `mPath` is itself a package
% path, the full package name will nevertheless be returned, i.e. *as if* it
% were self-enclosed.)
%
%—`pkgPath`: The corresponding directories. 
% 
% Empty arrays are returned if `mPath` does not feature package folders.
%
% If `mPath` features a single package folder, the returns are both
% string-scalars.
%
% If `mPath` features subpackages the returns are string-vectors (cascaded
% lists). See example below.
%
% __EXAMPLE__
%
% ```
% >> mPath = '/Applications/MATLAB_R2020a.app/toolbox/matlab/helptools/+helpUtils/+csh/mapTopic.m';  
% 
% >> [pkg, pkgPath] = Examiner.unpack( mPath )
%
% pkg =
%
%   2x1 string array
%
%     "helpUtils"
%     "helpUtils.csh"
%
%
% pkgPath =
%
%   2x1 string array
%
%     "/Applications/MATLAB_R2020a.app/toolbox/matlab/helptools/+helpUtils"
%     "/Applications/MATLAB_R2020a.app/toolbox/matlab/helptools/+helpUtils/+csh"
%
% ```
    arguments
        mPath string {valid.mustBeFileOrFolder};
    end

    assert( numel(mPath)==1, 'One file at a time...' );
    
    mPath = abspath( mPath ); % full path

    if ~count( mPath, [filesep '+'] ) 
        pkgs     = [];
        pkgPaths = [];
        return
    end

    % Only package *folders* are of interest: if present, trim off the filename
    % NOTE: this if-else step is only really needed in the unlikely event that
    % `mPath` is a filename beginning with '+' 
    if isfile( mPath ) 
        mPath = parent( mPath );
    else
        mPath = mPath;
    end
    
    folderNames = split( mPath, filesep );
    pkgNames    = folderNames( startsWith( folderNames, '+' ) ); 
    pkgNames    = extractAfter( pkgNames, '+' ); % removes '+' prefix
    
    % Returns are essentially known here, but safer to double-check:
    % Use `what()` while stepping to sub-most package folder
    nPkgs    = numel( pkgNames ); 
    pkgs     = strings( nPkgs, 1 );
    pkgPaths = strings( nPkgs, 1 );

    userDir  = pwd; 

    try
        % change to parent directory of base/top package folder
        cd( extractBefore( mPath, [filesep '+'] ) );
        
        for iPkg = 1 : nPkgs 

            pkgExpected = pkgNames(iPkg) ;
            info        = what(pwd); 
            
            % info.packages = packages in current directory
            assert( ismember( pkgExpected, info.packages ) );
            
            %% cd to pkg dir and assign returns
            cd( strcat('+', pkgExpected) );
            pkgs(iPkg)     = join(pkgNames(1:iPkg), '.'); % cascade subpacks
            pkgPaths(iPkg) = string(pwd);
        end
        
        cd(userDir);

    catch Me
        cd(userDir);
        Me.rethrow;
    end

end

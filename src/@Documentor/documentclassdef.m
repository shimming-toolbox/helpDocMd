function [docStr] = documentclassdef( Info, isDetailed, isDropdown )
%DOCUMENTCLASSDEF Return string vector of class documentation 
%
% Documents basic class attributes followed by class member documentation
% (courtesy of calls to `documentclassproperties` and `documentclassmethods`).
    arguments
        Info struct ;
        isDetailed {valid.mustBeBoolean} = true ;
        isDropdown {valid.mustBeBoolean} = true ;
    end

assert( strcmp(Info.mType, "classdef"), 'mFile is not a class' ) ;

docStr = Documentor.documentbasic( Info ) ;

% remove fields included in documentbasic 
Info = rmfield( Info, {'mType' ; 'Name' ; 'Description' ; 'DetailedDescription'} ) ;

if isDropdown % insert in HTML dropdown 
    docStr = [ docStr ; "<details markdown=""block"">" ; "<summary><b>Details</b></summary>"; " " ] ;
end 

%% Place basic (logical) attributes into markdown table
tableFields = { 'Hidden' ; 'Sealed' ; 'Abstract' ; 'Enumeration'; ... 
                'ConstructOnLoad' ; 'HandleCompatible'; 'RestrictsSubclassing' } ;

for iF = 1 : numel( tableFields )
    BasicAttributes.( tableFields{iF} ) = string( Info.( tableFields{iF} ) ) ;
end

docStr = [ docStr ; "" ; Documentor.tableattributes( BasicAttributes ) ; "" ] ; 

Info = rmfield( Info, tableFields ) ;

%%
fields = string( fieldnames( Info ) ) ;

for iField = 1 : numel(fields)
    
    field = char( fields( iField ) ) ;
    
    if isempty( Info.(field) )
        docStr(end+1) = strcat( "- ", field, " : [N/A] " ) ;
    elseif strcmp( field, 'SuperclassList' )
        docStr(end+1) = strcat( "- Superclasses: ", strjoin( Info.SuperclassList, ", " ) ) ;
    elseif ~isstruct( Info.(field) ) % Property + MethodList etc. will be structs (handle them separately)
        docStr(end+1) = strcat( "- ", fields(iField), " : ", string( Info.( field ) ) ) ;
    end
end

if isDropdown
    docStr = [docStr ; " " ; "</details>"];
end

docStr = [ docStr ; "" ; Documentor.documentclassproperties( Info, isDetailed ) ] ;    
docStr = [ docStr ; "" ; Documentor.documentclassmethods( Info ) ] ;    

end
    % names = strcat( "_", join(names, ", "), "_" ) ; % italicize
    % info  = [ info ; strcat( "- Parent classes: ", names ) ] ;
    %
    % if isempty( Mc.InferiorClasses ) 
    %     names = "(None)" ;
    % else 
    %     % NOTE: 'Mc.InferiorClasses' is a cell array whereas Mc.SuperclassList
    %     % is an object array, hence the for-loop: 
    %     names = string( Mc.InferiorClasses{1}.Name ) ;
    %     for iClass = 2 : numel(Mc.InferiorClasses)
    %         names = [ names string( Mc.InferiorClasses{ iClass }.Name ) ] ;
    %     end
    % end
    %
    % names = strcat( "_", join(names, ", "), "_" ) ; % italicize
    % info  = [ info ; strcat( "- Child classes: ", names ) ] ;
    %
    % if isempty( Mc.ContainingPackage ) 
    %     pkg = "N/A" ;
    % else
    %     pkg = string( Mc.ContainingPackage.Name ) ;
    % end
    %
    % info = [ info ; strcat( "- Containing Package: ", "_", pkg, "_" ) ] ;

% function [info] = documentclassattributes( Mc )
% %DOCUMENTCLASSATTRIBUTES        
%     arguments
%         Mc(1,1) meta.class ;
%     end
%
%     info = [ "" ; "#### Attributes ####" ; "" ] ; 
%     
%     fields = fieldnames( Mc ) ;
%
%     %% Basic attributes:
%     for iField = 1 : length( fields )
%         if islogical( Mc.(fields{iField}) ) 
%             % Applies to: "Hidden", "Sealed", "Abstract", "Enumeration",
%             % "ConstructOnLoad", "HandleCompatible", "RestrictsSubclassing"
%             value = join( string( Mc.( fields{iField} ) ), ", " ) ;
%             info  = [ info ; strcat( "- ", fields{iField}, ": ", value ) ] ;
%         end
%     end
%
%     %% Inheritances and package info:
%     %
%     %TODO when possible: add links to packages, parents, subclasses
%
%     if isempty( Mc.SuperclassList ) 
%         names = "(None)" ;
%     else
%         names = string( {Mc.SuperclassList.Name} ) ;
%     end
%
%     names = strcat( "_", join(names, ", "), "_" ) ; % italicize
%     info  = [ info ; strcat( "- Parent classes: ", names ) ] ;
%
%     if isempty( Mc.InferiorClasses ) 
%         names = "(None)" ;
%     else 
%         % NOTE: 'Mc.InferiorClasses' is a cell array whereas Mc.SuperclassList
%         % is an object array, hence the for-loop: 
%         names = string( Mc.InferiorClasses{1}.Name ) ;
%         for iClass = 2 : numel(Mc.InferiorClasses)
%             names = [ names string( Mc.InferiorClasses{ iClass }.Name ) ] ;
%         end
%     end
%     
%     names = strcat( "_", join(names, ", "), "_" ) ; % italicize
%     info  = [ info ; strcat( "- Child classes: ", names ) ] ;
%
%     if isempty( Mc.ContainingPackage ) 
%         pkg = "N/A" ;
%     else
%         pkg = string( Mc.ContainingPackage.Name ) ;
%     end
%
%     info = [ info ; strcat( "- Containing Package: ", "_", pkg, "_" ) ] ;
%
% end

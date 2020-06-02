function docStr = documentclassmethods( Info, isDropdown )
%DOCUMENTCLASSMETHODS Return string vector of class method documentation
    arguments
        Info struct ;
        isDropdown {mustBeBoolean} = true;
    end

% assert( strcmp(Info.mType, "classdef"), 'mFile is not a class' ) ;

docStr = [ "---" ; "## Methods" ; "" ] ;

if isempty( Info.MethodList )
    docStr = [ docStr ; "" ; "[No Methods]"; "" ] ;
    return ;
else
    for iMthd = 1 : numel( Info.MethodList ) 
        docStr = [ docStr ; "" ; "---" ; "" ;] ;

        Mthd = Info.MethodList( iMthd ) ; 
         
        if contains( which( Mthd.DefiningClass ), 'built-in' ) 
        % MATLAB built-in method: include name and defining class only:
            docStr(end+1) = strcat( "### ", Mthd.Name ) ;
            docStr(end+1) = [ "— _built-in method derived from class_ **" + Mthd.DefiningClass + "**. " ];
            docStr(end+1) = strcat( "For more info, refer to the MATLAB documentation." ) ;
        else
            
            docStr = [ docStr ; "" ; strcat( "### ", Mthd.Name ) ; "" ] ; 

            switch Mthd.Name 
                case Mthd.DefiningClass 
                    % don't fully include full constructor description here--done already in documentclassdef
                    docStr = [ docStr ; strcat( "**Synopsis**: _Constructor_ " ) ; "" ] ;
                    
                otherwise
                    if ~isempty( Mthd.Description )
                        docStr = [ docStr ; strcat( "**Synopsis**: _", Mthd.Description, "_ " ) ; "" ] ;
                    end

                    if ~isempty( Mthd.DetailedDescription )
                        % NOTE: could change Examiner so it doesn't fill DetailedDescription with the copy of Description...
                        if ~strcmp( Mthd.DetailedDescription, Mthd.Description )                         
                            docStr = [ docStr ; Mthd.DetailedDescription ; "" ] ;
                        end
                    end
            end
    
            Mthd = rmfield( Mthd, {'Name'; 'Description' ; 'DetailedDescription'} ) ;
            mthdFields = fieldnames( Mthd ) ;

            if isDropdown % insert in HTML dropdown 
                docStr = [ docStr ; "<details markdown=""block"">" ; " " ] ;
            end 

            %% Place basic (logical) attributes into markdown table
            basicFields = mthdFields( structfun( @islogical, Mthd ) ) ;
            
            for iF = 1 : numel( basicFields )
               BasicAttributes.( basicFields{iF} ) = Mthd.( basicFields{iF} ) ;
            end
            
            docStr = [ docStr ; "" ;  Documentor.tableattributes( BasicAttributes ) ; "" ] ;
            
            clear BasicAttributes ;
            Mthd = rmfield( Mthd, basicFields ) ;
            
            mthdFields = fieldnames( Mthd ) ;
     
            for iField = 1 : length( mthdFields ) 
            
                field = string( mthdFields( iField ) ) ;

                if isempty( Mthd.(field) )
                    docStr(end+1) = strcat( "- ", field, " : [N/A] " ) ;
                else 
                    docStr(end+1) = strcat( "- ", field, " : ", strjoin( string( Mthd.( field ) ), ", " ) ) ;
                end
            end
            
            if isDropdown
                docStr = [docStr ; " " ; "</details>"];
            end
        end
    end
end

end

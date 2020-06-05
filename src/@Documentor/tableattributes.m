function [txtTable] = tableattributes( Attributes )  
%TABLEATTRIBUTES Return markdown text table of class/classmember attributes 
%     
%     txtTable = tableattributes( Attributes )
% 
% `Attributes` is a struct of class member attributes and `txtTable` is
% returned as string vector where each element is a row in a dual-column table.
% 
% For instance, if `Attributes` possesses the 2 fields 
% ```
% Attributes.This = "One";
% Attributes.That = "Two";
% ```
% The output table will look like
%
% | Attribute | Value |
% |:---------:|:-----:|
% |   This    |  One  |
% |   That    |  Two  |
    arguments
        Attributes struct;
    end

column1 = pad([ " Attribute " ; ":-"; " " + string( fieldnames( Attributes ) ) + " " ]) ;
column2 = pad([ " Value " ; ":-"; " " + string(struct2cell(Attributes)) + " " ])  ;

% Center contents
column1{2}(end) = ':';
column2{2}(end) = ':';

column1(2) = replace( column1(2), " ", "-" ) ;
column2(2) = replace( column2(2), " ", "-" ) ;

% Borders
column1 = "|" + column1 ;
column2 = "|" + column2 + "|";

txtTable = column1 + column2 ;

end

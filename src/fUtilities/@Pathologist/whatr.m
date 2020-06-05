function [ Info ] = whatr( baseDir, isExcludingHidden )
% WHATR Recursive` what()` 
%     
%     Info = whatr( baseDir, isExcludingHidden )
%
%  Calls MATLAB function [what] for `baseDir` and each of its subdirectories,
%  and arrays the results to return `Info`.
%
% __INPUTS__ 
%     
%   `baseDir=["."]`
%     The parent/top directory path as a string scalar or character vector.
%
%   `isExcludingHidden=[true|1]`
%     A Boolean toggle: when set to false, hidden folders are included in the returned list.
%
% __ETC__ 
%
% To help remember the function name, think "what -r" on the commandline, and
% "what files are there?" in English.
%
% - [what](https://www.mathworks.com/help/matlab/ref/what.html)
%
% See also
% WHAT
    arguments
        baseDir(1,:) { valid.mustBeStringScalarOrCharVector, valid.mustBeFolder } = "." ;
        isExcludingHidden(1,1) { valid.mustBeBoolean } = true ;
    end

P = Pathologist( baseDir ) ;

%% recursive what() 
Info = what( P(1) ) ;
dirs = P.mapdirectorytree( P(1), false, isExcludingHidden ) ;   

for iSubDir = 1 : numel( dirs )
    Info = [ Info ; what( dirs( iSubDir ) ) ] ;
end

end

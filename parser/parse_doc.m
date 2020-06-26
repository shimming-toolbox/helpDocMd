function docStruct = parse_doc(functionPath)
%PARSE_DOC Generates a structure from the input function's documentation.
%
% SYNTAX
%   docStruct = parse_doc(functionPath)
%
% DESCRIPTION
%   Parses the function corresponding to the input path and fetches the
%   information corresponding to the function's documentation before
%   reorganising it as a structure
%
% INPUTS
%   functionPath
%     Character array corresponding to the path of the function. 
%
% OUTPUTS
%   docStruct
%     Structure containing the different parts of the function's
%     documentation as its fields (summary, description, inputs, outputs,
%     and notes).
%
% NOTES
% It requires a total respect of the template (e.g no "forgotten" spaces).
% All the fields (SYNTAX, DESCRIPTION, etc...) must be provided in the
% parsed function.

%% Read the function and keep only the description section
functionTxt = fopen(functionPath); % Open the function file

fgetl(functionTxt); % Skip the first line (function...)
% Initialize a cell that will receive the lines in the description
functionDoc = [];

textLine = fgetl(functionTxt);

while length(textLine) >= 1 % Parsing will stop at the end of description
    if erase(textLine, '%') ~= 0 % Delete the empty lines
        functionDoc = [functionDoc string(erase(textLine, '%'))];
    end
    textLine = fgetl(functionTxt);
end
% Close the function file
fclose(functionTxt);

%% Summary
docStruct.summary = functionDoc(1); % Store the summary of the function

%% Syntax
sectionStart = find(functionDoc == ' SYNTAX');
sectionEnd = find(functionDoc == ' DESCRIPTION');
docStruct.syntax = erase(functionDoc(sectionStart+1:sectionEnd-1),'   ');
%% Description 
sectionStart = find(functionDoc == ' DESCRIPTION');
sectionEnd = find(functionDoc == ' INPUTS');
docStruct.description = strip(strjoin(functionDoc(sectionStart+1:sectionEnd-1),'')); 
%% Inputs
sectionStart = find(functionDoc == ' INPUTS');
sectionEnd = find(functionDoc == ' OUTPUTS');
section = functionDoc(sectionStart+1:sectionEnd-1);
docStruct.inputs.names = strip(section(cellfun('isempty', strfind(section,'     '))));
docStruct.inputs.description = split(strjoin(replace(strip(section(2:end)),docStruct.inputs.names(:),'|||')),'|||')';
%% Outputs
sectionStart = find(functionDoc == ' OUTPUTS');
sectionEnd = find(functionDoc == ' NOTES');
section = functionDoc(sectionStart+1:sectionEnd-1);
docStruct.outputs.names = strip(section(cellfun('isempty', strfind(section,'     '))));
docStruct.outputs.description = split(strjoin(replace(strip(section(2:end)),docStruct.inputs.names(:),'|||')),'|||')';
%% Notes
sectionStart = find(functionDoc == ' NOTES');
docStruct.notes = strip(strjoin(functionDoc(sectionStart+1:end),'')); 

function [functionDoc,doc] = parse_doc(function_path)
%% Read the function and keep only the description section
functionTxt = fopen(function_path); % Open the function file

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
doc.summary = functionDoc(1); % Store the summary of the function

%% Syntax
sectionStart = find(functionDoc == ' SYNTAX');
sectionEnd = find(functionDoc == ' DESCRIPTION');
doc.syntax = erase(functionDoc(sectionStart+1:sectionEnd-1),'   ');
%% Description 
sectionStart = find(functionDoc == ' DESCRIPTION');
sectionEnd = find(functionDoc == ' INPUTS');
doc.description = strip(strjoin(functionDoc(sectionStart+1:sectionEnd-1),'')); 
%% Inputs
sectionStart = find(functionDoc == ' INPUTS');
sectionEnd = find(functionDoc == ' OUTPUTS');
section = functionDoc(sectionStart+1:sectionEnd-1);
doc.inputs.names = strip(section(cellfun('isempty', strfind(section,'     '))));
doc.inputs.description = split(strjoin(replace(strip(section(2:end)),doc.inputs.names(:),'|||')),'|||')';
%% Outputs
sectionStart = find(functionDoc == ' OUTPUTS');
sectionEnd = find(functionDoc == ' NOTES');
section = functionDoc(sectionStart+1:sectionEnd-1);
doc.outputs.names = strip(section(cellfun('isempty', strfind(section,'     '))));
doc.outputs.description = split(strjoin(replace(strip(section(2:end)),doc.inputs.names(:),'|||')),'|||')';
%% Notes
sectionStart = find(functionDoc == ' NOTES');
doc.notes = strip(strjoin(functionDoc(sectionStart+1:end),'')); 

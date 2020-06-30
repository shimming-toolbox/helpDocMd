function docStruct = parse_doc(functionPath)
%PARSE_DOC Generates a structure from the input function's documentation.
%
% SYNTAX
%
%   docStruct = parse_doc(functionPath)
%
% DESCRIPTION
%
%   Parses the function corresponding to the input path and fetches the
%   information corresponding to the function's documentation before
%   reorganising it as a structure
%
% INPUTS
%
%   functionPath
%     Character array corresponding to the path of the function.
%
% OUTPUTS
%
%   docStruct
%     Structure containing the different parts of the function's
%     documentation as its fields (summary, description, inputs, outputs,
%     and notes).
%
% NOTES
%
% It requires a total respect of the template (e.g no "forgotten" spaces).
% All the fields (SYNTAX, DESCRIPTION, etc...) must be provided in the
% parsed function.

%% Read the function and keep only the description section
functionTxt = fopen(functionPath); % Open the function file

fgetl(functionTxt); % Skip the first line (function...)
% Initialize a cell that will receive the lines in the description
functionDoc = [];

textLine = fgetl(functionTxt);
nLine = 1;
headersPos = []; % Store the positions of the headers
while length(textLine) >= 1 % Parsing will stop at first empty line
    if erase(textLine, '%') ~= 0 % Delete the empty commented lines
        
        functionDoc = [functionDoc string(erase(textLine, '%'))];
        
        if sum(isstrprop(strip(erase(textLine, '%')), 'upper')) ==...
                length(strip(erase(textLine, '%'))) % Check uppercase
            
            headersPos = [headersPos nLine]; % Store the header line
            
        end
        nLine = nLine+1;
    end
    textLine = fgetl(functionTxt); % Reads the next line
end

fclose(functionTxt); % Close the function file
headersPos = [headersPos length(functionDoc)+1]; % Position of the last line
%% Fetch the function's summary
docStruct.summary = functionDoc(1); % Store the summary of the function

%% Fetch the other sections

for nSection = 1:length(headersPos)-1 % Number of sections
    header = strip(functionDoc(headersPos(nSection))); % Section name
    sectionStart = headersPos(nSection)+1; % First line after header
    sectionEnd = headersPos(nSection+1)-1; % Last line before next header
    
    switch header
        case 'SYNTAX'
            docStruct.syntax = erase(functionDoc(sectionStart:sectionEnd),'   ');
        case 'DESCRIPTION'
            docStruct.description = strjoin(strip(functionDoc(sectionStart:sectionEnd)),' ');
        case 'INPUTS'
            section = functionDoc(sectionStart:sectionEnd);
            docStruct.inputs.names = strip(section(cellfun('isempty', strfind(section,'     '))));
            docStruct.inputs.description = split(strjoin(replace(strip(section(2:end)),docStruct.inputs.names(:),'|||')),'|||')';
        case 'OUTPUTS'
            section = functionDoc(sectionStart:sectionEnd);
            docStruct.outputs.names = strip(section(cellfun('isempty', strfind(section,'     '))));
            docStruct.outputs.description = split(strjoin(replace(strip(section(2:end)),docStruct.outputs.names(:),'|||')),'|||')';
        case 'NOTES'
            docStruct.notes = strjoin(strip(functionDoc(sectionStart:end)),'');
        otherwise
            error('Unknown section name in the function documentation')
    end
end

function test_parse_doc
%TEST_PARSE_DOC Is the unit test corresponding to parse_doc.m
%
% DESCRIPTION
%
% That function makes sure that parse_doc is working properly and returns
% the expected structure for the documentation.
cd('../parser')
docStruct = parse_doc('parse_doc.m');

assert(isstruct(docStruct)) % Check if docStruct is indeed a structure

% Make sure every input/output name matches a description
if docStruct.inputs.names ~= ''
assert(length(docStruct.inputs.names) == length(docStruct.inputs.description));
end
if docStruct.outputs.names ~= ''
assert(length(docStruct.outputs.names) == length(docStruct.outputs.description));
end
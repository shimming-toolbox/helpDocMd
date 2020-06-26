function [output1, output2] = test(arg1, arg2)
%TEST Computes output1 and output 2 from arg1 and arg2.
%
% SYNTAX
%
%   output1 = test(arg1, arg2)
%   [output1, output2] = test(arg1, arg2)
%
% DESCRIPTION
%
%   Computes output1 as the sum of arg1 and arg2 and output2 as the
%   difference between arg1 and arg2.
%
% INPUTS
%
%   arg1
%     Scalar. This line is very long because i wanted to test if the input
%     description would be correctly parsed if it is longer than one line.
%
%   arg2
%     Scalar
%
% OUTPUTS
%
%   output1
%     Sum of arg1 and arg2  
%
%   output2
%     Difference between arg1 and arg2
%
% NOTES
%
% That function is destined to test the parsing of the function
% documentation (done by parse_doc.m).

output1 = arg1+arg2;
% We don't want that kind of comments to appear in the parsed documentation.
output2 = arg1-arg2; % Neither this kind of comments

end

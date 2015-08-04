function [ outputStr ] = makeDateTimeString( )
%MAKEDATETIMESTRING Summary of this function goes here
%   Detailed explanation goes here

outputStr = '';
entries = datevec(now);
for i = 1:length(entries)
    outputStr = strcat(outputStr,'_',int2str(entries(i)));
end

end


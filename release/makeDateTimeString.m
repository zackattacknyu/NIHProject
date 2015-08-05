function [ outputStr ] = makeDateTimeString( )
%MAKEDATETIMESTRING outputs the following: "_<Date and Time now>"

outputStr = '';
entries = datevec(now);
for i = 1:length(entries)
    outputStr = strcat(outputStr,'_',int2str(entries(i)));
end

end


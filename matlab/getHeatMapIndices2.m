function [ outputInds ] = getHeatMapIndices2( indImages, wSize )
%GETHEATMAPINDICES Summary of this function goes here
%   Detailed explanation goes here

outputInds = cell(1,length(indImages));
for ind = 1:length(indImages)
    message = strcat('Select center of temperature zone ',num2str(ind));
    uiwait(msgbox(message));
    outputInds{ind} = getSelectionWindowInds(indImages{ind},wSize);
end

end


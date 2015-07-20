function [ diffVals,tempVals ] = getDiffTempVals3( indImages,diffValsImages,wSize,temps )
%GETDIFFTEMPVALS gets the change in temperature and change in HU values
%   Let N be number of temperature zones
%   Let M be number of comparisons
%   indImages - 1 by N cell of images to get indices for temperature zones
%   diffValsImages - N by M cell of images with temperature change values
%                   for zones
%   wSize - the half-width of the window where difference values are taken
%   temps - N by M array of temperature values
%           rows are temperature zones
%           columns are temperatures in those zones in different
%                   comparisons

[outputInds] = getHeatMapIndices2(indImages,wSize);

diffVals = [];
tempVals = [];
for row = 1:size(diffValsImages,1)
    curInds = outputInds{row};
    for col = 1:size(diffValsImages,2)
       curValImage = diffValsImages{row,col};
       curDiffVals = curValImage(curInds);
       diffVals = [diffVals;curDiffVals];
       
       curTempVals = temps(row,col)*ones(length(curDiffVals),1);
       tempVals = [tempVals;curTempVals];
    end
end

end


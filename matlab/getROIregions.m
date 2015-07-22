function [outputROI,minCoordsAll,maxCoordsAll] = getROIregions( ...
    fixedImg, threshold,pointsThreshold,roiRadius )
%GETROIREGIONS Summary of this function goes here
%   Detailed explanation goes here

imgCenter = size(fixedImg)./2;
fixedImgNeedle = single(fixedImg>threshold);

components = bwconncomp(fixedImgNeedle);
compPixelLists = components.PixelIdxList;
numComps = length(compPixelLists);
sizeComps = zeros(1,numComps);
for ind = 1:numComps
    sizeComps(ind) = length(compPixelLists{ind});
end
[numInComp,compIndices] = sort(sizeComps,'descend');
numImpComps = find(numInComp<pointsThreshold, 1 )-1;

outputROI = cell(numImpComps,2);
minCoordsAll = cell(numImpComps,2);
maxCoordsAll = cell(numImpComps,2);

for j = 1:numImpComps
    [rInd,cInd,zInd] = ind2sub(size(fixedImg),compPixelLists{compIndices(j)});
    pts = [rInd,cInd,zInd];
    [~,score] = pca(pts);
    needleScore = score(:,1);
    [~,pointInds] = sort(needleScore);
    needleStart = pts(pointInds(1),:);
    needleEnd = pts(pointInds(end),:);
    
    roiCenters = [needleEnd;needleStart];

    if(norm(needleStart-imgCenter)<norm(needleEnd-imgCenter)) %needle start is closer to center
        roiCenters = flipud(roiCenters);
    end
    
    for k = 1:2
        minCoords = max([1 1 1],roiCenters(k,:)-roiRadius);
        maxCoords = min(size(fixedImg),roiCenters(k,:)+roiRadius);
        outputROI{j,k} = fixedImg(minCoords(1):maxCoords(1),...
            minCoords(2):maxCoords(2),minCoords(3):maxCoords(3));
        
        minCoordsAll{j,k} = minCoords;
        maxCoordsAll{j,k} = maxCoords;
    end
    
    
    
end

end


%{

This program works by thresholding the CT scan in order to only have points
    with high HU value as those will have the needle.

The threshold is the HU value used for this.

It then finds the connected components and considers the components with a
    sufficient number (defined by points threshold) of points to be the needles. 

%}

clear all;
SETUP3

threshold = 2500; %HU for needle
pointsThreshold = 100; %number of points before connected component is considered important
roiRadius = 60;

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

for j = 1:numImpComps
    [rInd,cInd,zInd] = ind2sub(size(fixedImg),compPixelLists{compIndices(j)});
    pts = [rInd,cInd,zInd];
    [coeff,score,latent] = pca(pts);
    needleScore = score(:,1);
    [scores,pointInds] = sort(needleScore);
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
    end
    
    
    
end


function [outputROI,minCoordsAll,maxCoordsAll] = getROIregions( ...
    fixedImg, threshold,pointsThreshold,minNumNeedles,roiRadius )
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

%in case there are not components with more than 100, select the top ones anyway
numCompsUse = max(minNumNeedles,numImpComps); 

%make sure it doesn't select more components than what exists
numCompsUse = min(numCompsUse,numComps); 

outputROI = cell(numCompsUse,2);
minCoordsAll = cell(numCompsUse,2);
maxCoordsAll = cell(numCompsUse,2);

figure
hold on
title('3D Plot of high HU components (blue) and their endpoints, the ROI centers (red)');

for j = 1:numCompsUse
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
    
    plot3(roiCenters(:,1),roiCenters(:,2),roiCenters(:,3),'rx','MarkerSize',20,'LineWidth',3);
    plot3(pts(:,1),pts(:,2),pts(:,3),'b.')
    
    for k = 1:2
        minCoords = max([1 1 1],roiCenters(k,:)-roiRadius);
        maxCoords = min(size(fixedImg),roiCenters(k,:)+roiRadius);
        outputROI{j,k} = fixedImg(minCoords(1):maxCoords(1),...
            minCoords(2):maxCoords(2),minCoords(3):maxCoords(3));
        
        minCoordsAll{j,k} = minCoords;
        maxCoordsAll{j,k} = maxCoords;
    end
    
    
    
end

hold off

end


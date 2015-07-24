%{

This program works by thresholding the CT scan in order to only have points
    with high HU value as those will have the needle.

The threshold is the HU value used for this.

It then finds the connected components and considers the components with a
    sufficient number (defined by points threshold) of points to be the needles. 

%}

%clear all;
%SETUP

threshold = 2500; %HU for needle
pointsThreshold = 100; %number of points before connected component is considered important
numNeedleGuess = 3; %mininum number of connected components

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
numCompsUse = max(numNeedleGuess,numImpComps); 

%make sure it doesn't select more components than what exists
numCompsUse = min(numCompsUse,numComps); 

outputComp = cell(1,numCompsUse);
for j = 1:numCompsUse
    outputComp{j} = compPixelLists{compIndices(j)};
end

figure
hold on
for compNum = 1:numCompsUse
    
    [rInd,cInd,zInd] = ind2sub(size(fixedImg),outputComp{compNum});
    pts = [rInd,cInd,zInd];
    [coeff,score,latent] = pca(pts);
    needleScore = score(:,1);
    [scores,pointInds] = sort(needleScore);
    needleStart = pts(pointInds(1),:);
    needleEnd = pts(pointInds(end),:);
    needlePts = [needleStart;needleEnd];
    
    plot3(needlePts(:,1),needlePts(:,2),needlePts(:,3),'rx','MarkerSize',20,'LineWidth',3);
    plot3(pts(:,1),pts(:,2),pts(:,3),'b.')
    
end

hold off

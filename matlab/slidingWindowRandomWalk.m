function [ outputDiffValues ] = slidingWindowRandomWalk( img1,img2,fSize,Nsteps )
%SLIDINGWINDOWRANDOMWALK Summary of this function goes here
%   Detailed explanation goes here

rOffsets = 0:(2*fSize-1);
cOffsets = rOffsets;

finalDiffValues = zeros(size(img1));
visited = false(size(img1));

[~,bestR,bestC,squDiffArray] = getMinWindowSquDiff(img1,img2,rOffsets,cOffsets);

squDiffRange = squDiffArray(1+fSize:end-fSize,1+fSize:end-fSize);
[~,ii] = max(squDiffRange(:));
[startR,startC] = ind2sub(size(squDiffRange),ii);
startR = startR + fSize; startC = startC+fSize;

[forwardDirPixels,backwardDirPixels] = generateBothWalks(startR,startC,...
    size(squDiffRange,1),size(squDiffRange,2));
forwardDirPixels = forwardDirPixels+fSize;
backwardDirPixels = backwardDirPixels+fSize;

bestRvals = zeros(1,numel(img1));
bestCvals = zeros(1,numel(img2));

for stepNum = 1.5:0.5:numel(img1)
    
    step = floor(stepNum);
    if(step==stepNum)
        
        if(step>size(forwardDirPixels,1))
           continue; 
        end
        
        curStart = forwardDirPixels(step,:);
    else
        
        if(step>size(backwardDirPixels,1))
           continue; 
        end
        
        curStart = backwardDirPixels(step,:);
    end
    
    startR = curStart(1); startC = curStart(2);
    curLinInd = sub2ind(size(img1),startR,startC);
    
    [region1,region2] = getRegionsAroundPixel(img1,img2,startR,startC,fSize);
    
    %{
    This checks all the neighbors whose value has been computed and finds
       their best starting point. The values are averaged
    %}
    i = startR; j = startC;
    neighbors = [i+1 j-1;i+1 j;i+1 j+1;...
            i j-1;i j+1;...
            i-1 j-1;i-1 j;i+1 j];
    linInds = sub2ind(size(visited),neighbors(:,1),neighbors(:,2));
    visitedInds = linInds(visited(linInds)==true);
    if(numel(visitedInds)>0)
       bestR = ceil(mean(bestRvals(visitedInds)));
       bestC = ceil(mean(bestCvals(visitedInds)));
    end
    
    
    %{
    Generate random walk code deals with numbers from 1 to N. 
    Our offset range is 0 to N-1

    We thus add 1 to both starting Indices for the random walk
    and then subtract 1 from all values at the end
    %}
    offsets = generateRandomWalk(size(region1,1),size(region1,2),[bestR+1 bestC+1],Nsteps);
    offsets = offsets-1;

    [minSquDiff,bestR,bestC] = getMinWindowSquDiff(region1,region2,offsets(:,1),offsets(:,2));
    
    finalDiffValues(startR,startC) = minSquDiff;
    visited(startR,startC) = true;
    bestRvals(curLinInd)=bestR;
    bestCvals(curLinInd)=bestC;
end

outputDiffValues = finalDiffValues(1+fSize:end-fSize,1+fSize:end-fSize);

end


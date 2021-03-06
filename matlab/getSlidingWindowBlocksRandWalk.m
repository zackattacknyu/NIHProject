function [ diffFrameBlock ] = getSlidingWindowBlocksRandWalk( fixedROI,movingROI,fSize,Nsteps )
%GETAVERAGEFILTEREDBLOCKS Summary of this function goes here
%   Detailed explanation goes here

numR = size(fixedROI,1)-2*fSize; 
numC = size(fixedROI,2)-2*fSize; 
numZ = size(fixedROI,3);
diffFrameBlock = zeros(numR,numC,numZ);

for k=1:numZ
    datestr(now)
    fixedSlice = fixedROI(:,:,k);
    movingSlice = movingROI(:,:,k);
    diffFrameBlock(:,:,k) = slidingWindowRandomWalk(fixedSlice,movingSlice,fSize,Nsteps);
    k
end


end


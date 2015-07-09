function [ squFrames ] = getSlidingWindowBlocks( fixedImg,movingImg,wSize )
%GETAVERAGEFILTEREDBLOCKS Summary of this function goes here
%   Detailed explanation goes here

squFrames = cell(1,size(fixedImg,3));
%for k=1:size(fixedImg,3)
for k=130:160
    datestr(now)
    fixedSlice = fixedImg(:,:,k);
    movingSlice = movingImg(:,:,k);
    squFrames{k} = slidingWindowSquDiff(fixedSlice,movingSlice,wSize);
end

end


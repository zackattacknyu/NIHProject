function [ minSquDiff ] = getMinWindowSquDiffMonteCarlo( window1,window2,numRandOffsets )
%GETMINWINDOWSQUDIFF Summary of this function goes here
%   Detailed explanation goes here

%NOTE: Doing a mean difference between windows here is useless.
%       Because the result is the same as doing the convolution filter
%           on both images and subtracting
%      Hence we do a mean squared difference between entries
window1Rep = repmat(window1,2,2);
numWindowRows = size(window1,1);
numWindowCols = size(window2,2);
minSquDiff = Inf;

%makes random r and c offsets
linOffsets = randperm(numel(window1));
[rOffs, cOffs] = ind2sub(size(window1),linOffsets(1:numRandOffsets));
rOffsetValues = rOffs-1;
cOffsetValues = cOffs-1;

for ind = 1:numRandOffsets
    
    rOffset = rOffsetValues(ind);
    cOffset = cOffsetValues(ind);
    
    slidingWindow1 = window1Rep(1+rOffset:numWindowRows+rOffset,1+cOffset:numWindowCols+cOffset);
    diffWindows = window2-slidingWindow1;
    diffArray = diffWindows(:);
    meanDiff = mean(diffArray.^2);
    if(meanDiff < minSquDiff)
        minSquDiff = meanDiff;
    end
    
end


end


function [ minSquDiff,bestRoffset,bestCoffset,squDiffArray ] = getMinWindowSquDiff( window1,window2,rOffsets,cOffsets )
%GETMINWINDOWSQUDIFF Summary of this function goes here
%   Detailed explanation goes here

%NOTE: Doing a mean difference between windows here is useless.
%       Because the result is the same as doing the convolution filter
%           on both images and subtracting
%      Hence we do a mean squared difference between entries

numWindowRows = size(window1,1);
numWindowCols = size(window2,2);

rOffsetValues = 0:(numWindowRows-1);
cOffsetValues = 0:(numWindowCols-1);

if(nargin > 2)
    rOffsetValues = rOffsets;
    cOffsetValues = cOffsets;
end

window1Rep = repmat(window1,2,2);
minSquDiff = Inf;
for rInd = 1:numel(rOffsetValues)
    rOffset = rOffsetValues(rInd);
   for cInd = 1:numel(cOffsetValues)
       cOffset = cOffsetValues(cInd);
       
      slidingWindow1 = window1Rep(1+rOffset:numWindowRows+rOffset,...
          1+cOffset:numWindowCols+cOffset);
      diffWindows = window2-slidingWindow1;
      diffArray = diffWindows(:);
      meanDiff = mean(diffArray.^2);
      rOffset
      cOffset
      diffArray
      if(meanDiff < minSquDiff)
         minSquDiff = meanDiff;
         bestRoffset = rOffset;
         bestCoffset = cOffset;
         squDiffArray = diffWindows.^2;
      end
   end
end


end


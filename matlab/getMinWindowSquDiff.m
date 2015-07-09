function [ minSquDiff ] = getMinWindowSquDiff( window1,window2 )
%GETMINWINDOWSQUDIFF Summary of this function goes here
%   Detailed explanation goes here

%NOTE: Doing a mean difference between windows here is useless.
%       Because the result is the same as doing the convolution filter
%           on both images and subtracting
%      Hence we do a mean squared difference between entries
window1Rep = repmat(window1,2,2);
index = 1;
numWindowRows = size(window1,1);
numWindowCols = size(window2,2);
winN = numWindowRows*numWindowCols;
meanSquDiffs = zeros(winN,1);
for rOffset = 0:(numWindowRows-1)
   for cOffset = 0:(numWindowCols-1)
      slidingWindow1 = window1Rep(1+rOffset:numWindowRows+rOffset,...
          1+cOffset:numWindowCols+cOffset);
      diffWindows = window2-slidingWindow1;
      diffArray = diffWindows(:);
      meanSquDiffs(index) = mean(diffArray.^2);
      index = index+1;
   end
end
minSquDiff = min(meanSquDiffs);


end


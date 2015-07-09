function [ minSquDiff ] = getMinWindowSquDiff( window1,window2 )
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
for rOffset = 0:(numWindowRows-1)
   for cOffset = 0:(numWindowCols-1)
      slidingWindow1 = window1Rep(1+rOffset:numWindowRows+rOffset,...
          1+cOffset:numWindowCols+cOffset);
      diffWindows = window2-slidingWindow1;
      diffArray = diffWindows(:);
      meanDiff = mean(diffArray.^2);
      if(meanDiff < minSquDiff)
         minSquDiff = meanDiff;
      end
   end
end


end


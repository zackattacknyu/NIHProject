function [ WFrame ] = slidingWindowSquDiff( frame1,frame2, sR )
%WRONSKIAN Computes the wronskian change detector on two frames
%   frame1 - baseline frame
%   frame2 - current frame
%   sR - support radius

%sets up the wronskian frame
numRowsWFrame = size(frame1,1)-2*sR;
numColWFrame = size(frame1,2)-2*sR;
WFrame = zeros(numRowsWFrame,numColWFrame);

%sN = (sR*2+1)^2; %support N, number of pixels in support region
for i = (1+sR):(numRowsWFrame+sR)
   for j = (1+sR):(numColWFrame+sR)
      regionX = frame1((i-sR):(i+sR),(j-sR):(j+sR));
      regionY = frame2((i-sR):(i+sR),(j-sR):(j+sR));
      WFrame(i,j) = getMinWindowSquDiff(regionX,regionY);
   end
   i
end


end


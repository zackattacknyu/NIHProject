%TO BE RUN ONCE THE STRUCT IMAGESFRAMES HAS
%       BEEN MADE IN READFILE.M OR
%       ANOTHER SCRIPT/FUNCTION

%CONFIG VARS
%sliceNum = ceil(rand(1,1)*numSlices);
sliceNum = 80;
sR = 3; %support radius: radius around pixel of support region

%THE CODE FOLLOWING HERE 
%   SHOULD STAY CONSTANT
numSlices = size(imagesFrames,1);
numFrames = size(imagesFrames,2);

%these should be the same size
frame1 = imagesFrames{sliceNum,1};
frame2 = imagesFrames{sliceNum,2};

%sets up the wronskian frame
numRowsWFrame = size(frame1,1)-2*sR;
numColWFrame = size(frame1,2)-2*sR;
WFrame = zeros(numRowsWFrame,numColWFrame);

%makes the wronskian frame
sN = (sR*2+1)^2; %support N, number of pixels in support region
for i = (1+sR):(numRowsWFrame-sR)
   for j = (1+sR):(numColWFrame-sR)
      regionX = frame1((i-sR):(i+sR),(j-sR):(j+sR));
      regionY = frame2((i-sR):(i+sR),(j-sR):(j+sR));
      regionX = regionX(:); regionY = regionY(:);
      squaredSum = sum((regionX.^2)./(regionY.^2));
      normalSum = sum(regionX./regionY);
      wValue = (squaredSum+normalSum)/sN;
      WFrame(i,j) = wValue;
   end
end

diffFrame = frame2-frame1;

figure
imagesc(WFrame);
colorbar

figure
imagesc(diffFrame);
colorbar

figure
imagesc(frame1);
colorbar

figure
imagesc(frame2);
colorbar
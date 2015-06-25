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

WFrame = wronskian(frame1,frame2,sR);

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
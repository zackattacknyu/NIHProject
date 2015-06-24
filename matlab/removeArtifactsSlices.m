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

figure
imagesc(frame1);
colorbar

figure
imagesc(frame2);
colorbar

figure
R = radon(frame1);
I1 = iradon(R,0:179);
%I2 = iradon(R,0:179,'linear','none');
subplot(1,3,1), imshow(frame1), title('Original')
subplot(1,3,2), imshow(I1), title('Filtered backprojection')
subplot(1,3,3), imshow(I2,[]), title('Unfiltered backprojection')
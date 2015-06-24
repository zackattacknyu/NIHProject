%TO BE CHANGED AT WILL
numFrames = 2;
filename = '[XYZCT] registered timestepSample.tif';

%SHOULD STAY RELATIVELY CONSTANT
imgInfo = imfinfo(filename);
num_images = numel(imgInfo);
numSlices = floor(num_images/numFrames);
images = cell(1,num_images);
for k = 1:num_images
   images{k} = imread(filename,k); 
end
imagesFrames = reshape(images,numSlices,numFrames);
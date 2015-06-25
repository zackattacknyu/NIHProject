%CHANGE THIS DURING TESTS
numFrames = 3;
sR = 1;
%filename = '[XYZCT] registered timestepSample.tif';
%filename = '[XYZCT] registered timeSeries1_5005-5007_slices50-249.tif';
filename = 'timeSeries1_5005-5007_slices50-249.tif';
thresholdFactor = 1; %this number times the max pixel is the threshold

%REST OF THIS CODE SHOULD
%   STAY THE SAME
imgInfo = imfinfo(filename);
num_images = numel(imgInfo);
images = cell(1,num_images);
for k = 1:num_images
   images{k} = imread(filename,k);
end
imagesArray = zeros([size(images{1}) num_images]);
for k = 1:num_images
   imagesArray(:,:,k) = images{k};
end
maxPixel = max(max(max(imagesArray)));
threshold = maxPixel*thresholdFactor;
thresholdImages = imagesArray>=threshold;
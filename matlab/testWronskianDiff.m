%CHANGE THIS DURING TESTS
numFrames = 3;
sR = 1;
%filename = '[XYZCT] registered timestepSample.tif';
filename = '[XYZCT] registered timeSeries1_5005-5007_slices50-249.tif';

%REST OF THIS CODE SHOULD
%   STAY THE SAME
imgInfo = imfinfo(filename);
num_images = numel(imgInfo);
numSlices = floor(num_images/numFrames);
images = cell(1,num_images);
for k = 1:num_images
   images{k} = imread(filename,k);
end

imagesFrames = reshape(images,numSlices,numFrames);
imagesArray = zeros([size(images{1}) num_images]);
for k = 1:num_images
   imagesArray(:,:,k) = images{k};
end

numRowsWFrame = size(images{1},1)-2*sR;
numColWFrame = size(images{1},2)-2*sR;
for secondFrame = 2:numFrames
    wronskianArray = zeros(numRowsWFrame,numColWFrame,numSlices);
    diffArray = zeros([size(images{1}) numSlices]);
    for k = 1:numSlices
        baselineFrame = imagesFrames{k,1};
        comparisonFrame = imagesFrames{k,secondFrame};
        wronskianArray(:,:,k) = wronskian(baselineFrame,comparisonFrame,sR);
        diffArray(:,:,k) = baselineFrame-comparisonFrame;
        k
    end
    imtool3D(wronskianArray);
    imtool3D(diffArray);
    
end

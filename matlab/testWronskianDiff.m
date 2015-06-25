%TO BE CHANGED AT WILL
numFrames = 2;
sR = 3;
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
%%
imagesArray = zeros([size(images{1}) num_images]);
for k = 1:num_images
   imagesArray(:,:,k) = images{k};
end

%%

numRowsWFrame = size(images{1},1)-2*sR;
numColWFrame = size(images{1},2)-2*sR;
wronskianArray = zeros(numRowsWFrame,numColWFrame,numSlices);
diffArray = zeros([size(images{1}) numSlices]);
for k = 1:numSlices
    frame1 = imagesFrames{k,1};
    frame2 = imagesFrames{k,2};
    wronskianArray(:,:,k) = wronskian(frame1,frame2,sR);
    diffArray(:,:,k) = frame1-frame2;
    k
end
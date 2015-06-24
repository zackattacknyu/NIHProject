numSlices = size(imagesFrames,1);
numFrames = size(imagesFrames,2);
randSlice = ceil(rand(1,1)*numSlices);

figure
imagesc(imagesFrames{randSlice,1});
colorbar

figure
imagesc(imagesFrames{randSlice,1});
colorbar
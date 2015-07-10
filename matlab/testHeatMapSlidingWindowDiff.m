%{
imgNum = 144;
fixedSlice = fixedImg(:,:,imgNum);
movingSlice = movingImg3(:,:,imgNum);
squFrame = slidingWindowSquDiff(fixedSlice,movingSlice,8);
%}

%squFrameBlock = getSlidingWindowBlocks(fixedImg,movingImg3,8);

wSize=4;

numRowsWFrame = size(fixedImg,1)-2*wSize;
numColWFrame = size(fixedImg,2)-2*wSize;
squFrames = cell(1,size(fixedImg,3));
squFrames2 = cell(1,size(fixedImg,3));
%squFrames = zeros(numRowsWFrame,numColWFrame,size(fixedImg,3));
%squFrames2 = zeros(numRowsWFrame,numColWFrame,size(fixedImg,3));

for k=142:155
    datestr(now)
    fixedSlice = fixedImg(:,:,k);
    movingSlice = movingImg3(:,:,k);
    movingSlice2 = movingImg4(:,:,k);
    squFrames{k} = slidingWindowSquDiff(fixedSlice,movingSlice,wSize);
    squFrames2{k} = slidingWindowSquDiff(fixedSlice,movingSlice2,wSize);
    %squFrames(:,:,k) = slidingWindowSquDiff(fixedSlice,movingSlice,wSize);
    %squFrames2(:,:,k) = slidingWindowSquDiff(fixedSlice,movingSlice2,wSize);
end

meanSquFrames = sqrt(squFrames);











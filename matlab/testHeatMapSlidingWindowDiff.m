%{
imgNum = 144;
fixedSlice = fixedImg(:,:,imgNum);
movingSlice = movingImg3(:,:,imgNum);
squFrame = slidingWindowSquDiff(fixedSlice,movingSlice,8);
%}

%squFrameBlock = getSlidingWindowBlocks(fixedImg,movingImg3,8);

numRowsWFrame = size(fixedImg,1)-2*sR;
numColWFrame = size(fixedImg,2)-2*sR;
squFrames = zeros(numRowsWFrame,numColWFrame,size(fixedImg,3));

wSize=8;
for k=135:155
    datestr(now)
    fixedSlice = fixedImg(:,:,k);
    movingSlice = movingImg(:,:,k);
    squFrames(:,:,k) = slidingWindowSquDiff(fixedSlice,movingSlice,wSize);
end

meanSquFrames = sqrt(squFrames);











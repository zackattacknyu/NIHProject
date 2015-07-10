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

for k=148:155
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

%%

squFramesArray = zeros([size(squFrames{143}) size(fixedImg,3)]);
squFramesArray2 = zeros([size(squFrames{143}) size(fixedImg,3)]);
%%
for k=148:155
    squFramesArray(:,:,k) = squFrames{k};
    squFramesArray2(:,:,k) = squFrames2{k};
end











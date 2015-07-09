imgNum = 144;

fixedSlice = fixedImg(:,:,imgNum);
movingSlice = movingImg3(:,:,imgNum);

squFrame = slidingWindowSquDiff(fixedSlice,movingSlice,8);












imgNum = 144;

fixedSlice = fixedImg(:,:,imgNum);
movingSlice = movingImg3(:,:,imgNum);
diff = slidingWindowEntropy(fixedSlice,movingSlice,4);

%%

figure
imagesc(diff);













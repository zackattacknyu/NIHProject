fixedROI = fixedImg(rInds,cInds,zInds);
movingROI = movingImg3(rInds,cInds,zInds);
movingROI2 = movingImg4(rInds,cInds,zInds);

tic
diffFrameBlock = getSlidingWindowBlocks(fixedROI,movingROI,fSize);
time1=toc

tic
diffFrameBlock2 = getSlidingWindowBlocks(fixedROI,movingROI2,fSize);
time2=toc
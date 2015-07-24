fixedROI = fixedImg(rInds,cInds,zInds);
movingROI = movingImg3(rInds,cInds,zInds);
movingROI2 = movingImg4(rInds,cInds,zInds);

fSize=4;
Nsteps=10;
diffFrameBlockRandWalk_10 = getSlidingWindowBlocksRandWalk( fixedROI,movingROI,fSize,Nsteps );
diffFrameBlockRandWalk2_10 = getSlidingWindowBlocksRandWalk( fixedROI,movingROI2,fSize,Nsteps );

Nsteps=50;
diffFrameBlockRandWalk_50 = getSlidingWindowBlocksRandWalk( fixedROI,movingROI,fSize,Nsteps );
diffFrameBlockRandWalk2_50 = getSlidingWindowBlocksRandWalk( fixedROI,movingROI2,fSize,Nsteps );

diffFrameBlock = getSlidingWindowBlocks(fixedROI,movingROI,fSize);
diffFrameBlock2 = getSlidingWindowBlocks(fixedROI,movingROI2,fSize);
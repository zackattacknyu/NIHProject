fixedROI = fixedImg(rInds,cInds,zInds);
movingROI = movingImg3(rInds,cInds,zInds);
movingROI2 = movingImg4(rInds,cInds,zInds);

fSize=4;

Nsteps=10;
tic
diffFrameBlockRandWalk_10 = getSlidingWindowBlocksRandWalk( fixedROI,movingROI,fSize,Nsteps );
time1=toc

tic
diffFrameBlockRandWalk2_10 = getSlidingWindowBlocksRandWalk( fixedROI,movingROI2,fSize,Nsteps );
time2=toc



Nsteps=50;
tic
diffFrameBlockRandWalk_50 = getSlidingWindowBlocksRandWalk( fixedROI,movingROI,fSize,Nsteps );
time3=toc

tic
diffFrameBlockRandWalk2_50 = getSlidingWindowBlocksRandWalk( fixedROI,movingROI2,fSize,Nsteps );
time4=toc




tic
diffFrameBlock = getSlidingWindowBlocks(fixedROI,movingROI,fSize);
time5=toc

tic
diffFrameBlock2 = getSlidingWindowBlocks(fixedROI,movingROI2,fSize);
time6=toc
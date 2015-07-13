%gets data for Pt 9
clear all
SETUP
fSize=4;
rInds=181:242;cInds=133:204;zInds=120:145;
fixedROI = fixedImg(rInds,cInds,zInds);
movingROI = movingImg3(rInds,cInds,zInds);
movingROI2 = movingImg4(rInds,cInds,zInds);
diffFrameBlock = getSlidingWindowBlocks(fixedROI,movingROI,fSize);
diffFrameBlock2 = getSlidingWindowBlocks(fixedROI,movingROI2,fSize);
save('script7_21_pt9Values.mat');

%gets data for Pt 4
clear all
SETUP3
fSize=4;
rInds=60:130;cInds=1:80;zInds=100:140;
fixedROI = fixedImg(rInds,cInds,zInds);
movingROI = movingImg3(rInds,cInds,zInds);
movingROI2 = movingImg4(rInds,cInds,zInds);
diffFrameBlock = getSlidingWindowBlocks(fixedROI,movingROI,fSize);
diffFrameBlock2 = getSlidingWindowBlocks(fixedROI,movingROI2,fSize);
save('script7_21_pt4Values.mat');

%gets data for Pt 8
clear all
SETUP2
fSize=4;
rInds = 60:130; cInds = 100:170; zInds = 200:230;
fixedROI = fixedImg(rInds,cInds,zInds);
movingROI = movingImg3(rInds,cInds,zInds);
movingROI2 = movingImg4(rInds,cInds,zInds);
diffFrameBlock = getSlidingWindowBlocks(fixedROI,movingROI,fSize);
diffFrameBlock2 = getSlidingWindowBlocks(fixedROI,movingROI2,fSize);
save('script7_21_pt8Values.mat');


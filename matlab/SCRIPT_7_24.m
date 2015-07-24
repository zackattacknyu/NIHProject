%gets data for Pt 9
clear all
SETUP
fSize=4;
%rInds=181:242;cInds=133:204;zInds=120:145;
rInds=140:260;cInds=40:210;zInds=120:155;
fixedROI = fixedImg(rInds,cInds,zInds);
movingROI = movingImg3(rInds,cInds,zInds);
movingROI2 = movingImg4(rInds,cInds,zInds);
diffFrameBlock = getSlidingWindowBlocks(fixedROI,movingROI,fSize);
diffFrameBlock2 = getSlidingWindowBlocks(fixedROI,movingROI2,fSize);
save('script7_24_pt9Values.mat');

%gets data for Pt 4
%   good ablation zone seems to be shown here
clear all
SETUP3
fSize=4;
rInds=60:130;cInds=1:80;zInds=100:140;
fixedROI = fixedImg(rInds,cInds,zInds);
movingROI = movingImg3(rInds,cInds,zInds);
movingROI2 = movingImg4(rInds,cInds,zInds);
diffFrameBlock = getSlidingWindowBlocks(fixedROI,movingROI,fSize);
diffFrameBlock2 = getSlidingWindowBlocks(fixedROI,movingROI2,fSize);
save('script7_24_pt4Values.mat');

%gets data for Pt 8
clear all
SETUP2
fSize=4;
rInds = 60:190; cInds = 100:270; zInds = 200:230;
fixedROI = fixedImg(rInds,cInds,zInds);
movingROI = movingImg3(rInds,cInds,zInds);
movingROI2 = movingImg4(rInds,cInds,zInds);
diffFrameBlock = getSlidingWindowBlocks(fixedROI,movingROI,fSize);
diffFrameBlock2 = getSlidingWindowBlocks(fixedROI,movingROI2,fSize);
save('script7_24_pt8Values.mat');

%gets data for Pt 5, baseline 1
clear all
SETUP6
fSize=4;
rInds=1:78;cInds=40:142;zInds=70:100;
fixedROI = fixedImg(rInds,cInds,zInds);
movingROI = movingImg3(rInds,cInds,zInds);
movingROI2 = movingImg4(rInds,cInds,zInds);
diffFrameBlock = getSlidingWindowBlocks(fixedROI,movingROI,fSize);
diffFrameBlock2 = getSlidingWindowBlocks(fixedROI,movingROI2,fSize);
save('script7_24_pt5b1Values.mat');

%gets data for Pt 5, baseline 3
clear all
SETUP7
fSize=4;
rInds=1:120;cInds=40:176;zInds=90:110;
fixedROI = fixedImg(rInds,cInds,zInds);
movingROI = movingImg3(rInds,cInds,zInds);
movingROI2 = movingImg4(rInds,cInds,zInds);
diffFrameBlock = getSlidingWindowBlocks(fixedROI,movingROI,fSize);
diffFrameBlock2 = getSlidingWindowBlocks(fixedROI,movingROI2,fSize);
save('script7_24_pt5b3Values.mat');
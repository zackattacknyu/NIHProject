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
save('script7_14_pt5b1Values.mat');

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
save('script7_14_pt5b3Values.mat');

%{
niiSlideImage = make_nii(diffFrameBlock); 
save_nii(niiSlideImage,'niftiFilesPt8/slidingWindowDiffBlock_5002_5003.nii');
niiSlideImage = make_nii(diffFrameBlock2); 
save_nii(niiSlideImage,'niftiFilesPt8/slidingWindowDiffBlock_5002_5004.nii');
%}


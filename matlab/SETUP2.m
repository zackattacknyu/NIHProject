parentDir = 'niftiFilesPt8/';
niiFixed = load_nii(strcat(parentDir,'fixed_5002.nii'));
niiMoving = load_nii(strcat(parentDir,'moving_5003.nii'));
niiMoving2 = load_nii(strcat(parentDir,'moving_5004.nii'));
niiMovingReg = load_nii(strcat(parentDir,'moving_5003_registered.nii'));
niiMovingReg2 = load_nii(strcat(parentDir,'moving_5004_registered.nii'));


fixedImg = niiFixed.img;
movingImg = niiMoving.img;
movingImg2 = niiMoving2.img;
movingImg3 = niiMovingReg.img;
movingImg4 = niiMovingReg2.img;
load('niftiFilesPt8/dcmVars.mat');

fixedImg = fixedImg.*fixedSlope + fixedInt;
movingImg = movingImg.*movingSlope + movingInt;
movingImg2 = movingImg2.*movingSlope2 + movingInt2;
movingImg3 = movingImg3.*movingSlope + movingInt;
movingImg4 = movingImg4.*movingSlope2 + movingInt2;
parentDir = 'niftiFiles/';

niiFixed = load_nii(strcat(parentDir,'fixed_5005.nii'));
niiMoving = load_nii(strcat(parentDir,'moving_5006.nii'));
niiMoving2 = load_nii(strcat(parentDir,'moving_5007.nii'));
niiMovingReg = load_nii(strcat(parentDir,'moving_5006_registered.nii'));
niiMovingReg2 = load_nii(strcat(parentDir,'moving_5007_registered.nii'));

fixedImg = niiFixed.img;
movingImg = niiMoving.img;
movingImg2 = niiMoving2.img;
movingImg3 = niiMovingReg.img;
movingImg4 = niiMovingReg2.img;

parentDir = 'timeSeries1_5005-5007/';
fixedFolderName = strcat(parentDir,'ser_5005/');
movingFolderName = strcat(parentDir,'ser_5006/');
movingFolderName2 = strcat(parentDir,'ser_5007/');

[~,~,~,fixedSlope,fixedInt] = getDCMFolderData(fixedFolderName);
[~,~,~,movingSlope,movingInt] = getDCMFolderData(movingFolderName);
[~,~,~,movingSlope2,movingInt2] = getDCMFolderData(movingFolderName2);

%temporary. 
%   TO BE DELETED ONCE PROPER HU UNITS ARE IN NII FILES
fixedImg = fixedImg.*fixedSlope + fixedInt;
movingImg = movingImg.*movingSlope + movingInt;
movingImg2 = movingImg2.*movingSlope2 + movingInt2;
movingImg3 = movingImg3.*movingSlope + movingInt;
movingImg4 = movingImg4.*movingSlope2 + movingInt2;
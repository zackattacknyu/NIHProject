parentDir = 'timeSeries1_5005-5007/';
fixedFolderName = strcat(parentDir,'ser_5005/');
movingFolderName = strcat(parentDir,'ser_5006/');
movingFolderName2 = strcat(parentDir,'ser_5007/');

thresholdHU = 400;
dcmDataFixed = single(getDCMFolderDataHUThreshold(fixedFolderName,thresholdHU));
dcmDataMoving = single(getDCMFolderDataHUThreshold(movingFolderName,thresholdHU));
dcmDataMoving2 = single(getDCMFolderDataHUThreshold(movingFolderName2,thresholdHU));

niiFixedThresh = make_nii(dcmDataFixed);
niiMovingThresh = make_nii(dcmDataMoving);
niiMoving2Thresh = make_nii(dcmDataMoving2);

parentDir = 'niftiFiles/';
save_nii(niiFixedThresh,strcat(parentDir,'fixedThreshHU_5005.nii'));
save_nii(niiMovingThresh,strcat(parentDir,'movingThreshHU_5006.nii'));
save_nii(niiMoving2Thresh,strcat(parentDir,'movingThreshHU_5007.nii'));
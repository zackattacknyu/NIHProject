%images 60-186 for ser_5005 have needle
%   that will work for ser_5006 and ser_5007

%folderNames = {'ser_5005','ser_5006'};
%folderNames = {'ser_5005','ser_5007'};
parentDir = 'timeSeries1_5005-5007/';
fixedFolderName = strcat(parentDir,'ser_5005/');
movingFolderName = strcat(parentDir,'ser_5006/');
movingFolderName2 = strcat(parentDir,'ser_5007/');
thresholdFactor = 0.85;

dcmDataFixed = single(getDCMFolderDataThreshold(fixedFolderName,thresholdFactor));
dcmDataMoving = single(getDCMFolderDataThreshold(movingFolderName,thresholdFactor));
dcmDataMoving2 = single(getDCMFolderDataThreshold(movingFolderName2,thresholdFactor));

[~,dcmRawFixed] = getDCMFolderData(fixedFolderName);
[~,dcmRawMoving] = getDCMFolderData(movingFolderName);
[~,dcmRawMoving2] = getDCMFolderData(movingFolderName2);

dcmRawFixed = single(dcmRawFixed);
dcmRawMoving = single(dcmRawMoving);
dcmRawMoving2 = single(dcmRawMoving2);

niiFixedThresh = make_nii(dcmDataFixed);
niiMovingThresh = make_nii(dcmDataMoving);
niiMovingThresh2 = make_nii(dcmDataMoving2);

niiFixed = make_nii(dcmRawFixed);
niiMoving = make_nii(dcmRawMoving);
niiMoving2 = make_nii(dcmRawMoving2);

parentDir = 'niftiFiles/';
save_nii(niiFixedThresh,strcat(parentDir,'fixedThresh_5005.nii'));
save_nii(niiMovingThresh,strcat(parentDir,'movingThresh_5006.nii'));
save_nii(niiMovingThresh2,strcat(parentDir,'movingThresh_5007.nii'));
%%
save_nii(niiFixed,strcat(parentDir,'fixed_5005.nii'));
save_nii(niiMoving,strcat(parentDir,'moving_5006.nii'));
save_nii(niiMoving2,strcat(parentDir,'moving_5007.nii'));
parentDir = 'timeSeries1_5005-5007/';
fixedFolderName = strcat(parentDir,'ser_5005/');
movingFolderName = strcat(parentDir,'ser_5006/');
movingFolderName2 = strcat(parentDir,'ser_5007/');

[~,~,dcmRawFixed,fixedSlope,fixedInt] = getDCMFolderData(fixedFolderName);
[~,~,dcmRawMoving,movingSlope,movingInt] = getDCMFolderData(movingFolderName);
[~,~,dcmRawMoving2,movingSlope2,movingInt2] = getDCMFolderData(movingFolderName2);
%%
niiFixed = make_nii(dcmRawFixed);
niiMoving = make_nii(dcmRawMoving);
niiMoving2 = make_nii(dcmRawMoving2);
%%
parentDir = 'niftiFiles2/';

save_nii(niiFixed,strcat(parentDir,'fixed_5005.nii'));
save_nii(niiMoving,strcat(parentDir,'moving_5006.nii'));
save_nii(niiMoving2,strcat(parentDir,'moving_5007.nii'));
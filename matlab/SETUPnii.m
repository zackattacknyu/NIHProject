parentDir = 'timeSeriesPt8_5002-5004/';
fixedFolderName = strcat(parentDir,'ser_5002/');
movingFolderName = strcat(parentDir,'ser_5003/');
movingFolderName2 = strcat(parentDir,'ser_5004/');

[~,dcmFixed,~,fixedSlope,fixedInt] = getDCMFolderData(fixedFolderName);
[~,dcmMoving,~,movingSlope,movingInt] = getDCMFolderData(movingFolderName);
[~,dcmMoving2,~,movingSlope2,movingInt2] = getDCMFolderData(movingFolderName2);

niiFixed = make_nii(dcmFixed);
niiMoving = make_nii(dcmMoving);
niiMoving2 = make_nii(dcmMoving2);

parentDir = 'niftiFilesPt8/';
save(strcat(parentDir,'dcmVars.mat'),'fixedSlope','fixedInt',...
    'movingSlope','movingSlope2','movingInt','movingInt2');

save_nii(niiFixed,strcat(parentDir,'fixed_5002.nii'));
save_nii(niiMoving,strcat(parentDir,'moving_5003.nii'));
save_nii(niiMoving2,strcat(parentDir,'moving_5004.nii'));

%%


parentDir = 'niftiFiles3/';

niiFixed = load_nii(strcat(parentDir,'fixed_5005.nii'));
niiMoving = load_nii(strcat(parentDir,'moving_5006.nii'));
niiMoving2 = load_nii(strcat(parentDir,'moving_5007.nii'));
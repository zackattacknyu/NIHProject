parentDir = 'timeSeriesPt5_5021-5023/';
fixedFolderName = strcat(parentDir,'Fluoroscopyser_5021/');
movingFolderName = strcat(parentDir,'Fluoroscopyser_5022/');
movingFolderName2 = strcat(parentDir,'Fluoroscopyser_5023/');

[~,dcmFixed,~,fixedSlope,fixedInt] = getDCMFolderData(fixedFolderName);
[~,dcmMoving,~,movingSlope,movingInt] = getDCMFolderData(movingFolderName);
[~,dcmMoving2,~,movingSlope2,movingInt2] = getDCMFolderData(movingFolderName2);

niiFixed = make_nii(dcmFixed);
niiMoving = make_nii(dcmMoving);
niiMoving2 = make_nii(dcmMoving2);

parentDir = 'niftiFilesPt5_b3/';
save(strcat(parentDir,'dcmVars.mat'),'fixedSlope','fixedInt',...
    'movingSlope','movingSlope2','movingInt','movingInt2');

save_nii(niiFixed,strcat(parentDir,'fixed_5021.nii'));
save_nii(niiMoving,strcat(parentDir,'moving_5022.nii'));
save_nii(niiMoving2,strcat(parentDir,'moving_5023.nii'));

%%


parentDir = 'niftiFilesPt1/';

niiFixed = load_nii(strcat(parentDir,'fixed_5007.nii'));
niiMoving = load_nii(strcat(parentDir,'moving_5008.nii'));
niiMoving2 = load_nii(strcat(parentDir,'moving_5009.nii'));
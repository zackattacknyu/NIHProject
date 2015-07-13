parentDir = 'timeSeriesPt5_5012-5014/';
fixedFolderName = strcat(parentDir,'Fluoroscopyser_5012/');
movingFolderName = strcat(parentDir,'Fluoroscopyser_5013/');
movingFolderName2 = strcat(parentDir,'Fluoroscopyser_5014/');

[~,dcmFixed,~,fixedSlope,fixedInt] = getDCMFolderData(fixedFolderName);
[~,dcmMoving,~,movingSlope,movingInt] = getDCMFolderData(movingFolderName);
[~,dcmMoving2,~,movingSlope2,movingInt2] = getDCMFolderData(movingFolderName2);

niiFixed = make_nii(dcmFixed);
niiMoving = make_nii(dcmMoving);
niiMoving2 = make_nii(dcmMoving2);
%%
parentDir = 'niftiFilesPt5_b1/';
save(strcat(parentDir,'dcmVars.mat'),'fixedSlope','fixedInt',...
    'movingSlope','movingSlope2','movingInt','movingInt2');
%%
save_nii(niiFixed,strcat(parentDir,'fixed_5012.nii'));
save_nii(niiMoving,strcat(parentDir,'moving_5013.nii'));
save_nii(niiMoving2,strcat(parentDir,'moving_5014.nii'));

%%


parentDir = 'niftiFilesPt1/';

niiFixed = load_nii(strcat(parentDir,'fixed_5007.nii'));
niiMoving = load_nii(strcat(parentDir,'moving_5008.nii'));
niiMoving2 = load_nii(strcat(parentDir,'moving_5009.nii'));
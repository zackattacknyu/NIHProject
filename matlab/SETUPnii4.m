parentDir = 'timeSeriesPt1_5007-5009/';
fixedFolderName = strcat(parentDir,'IR_Microwave_Ablationser_5007/');
movingFolderName = strcat(parentDir,'Abdomen_3fpsser_5008/');
movingFolderName2 = strcat(parentDir,'IR_Microwave_Ablationser_5009/');

[~,dcmFixed,~,fixedSlope,fixedInt] = getDCMFolderData(fixedFolderName);
[~,dcmMoving,~,movingSlope,movingInt] = getDCMFolderData(movingFolderName);
[~,dcmMoving2,~,movingSlope2,movingInt2] = getDCMFolderData(movingFolderName2);

niiFixed = make_nii(dcmFixed);
niiMoving = make_nii(dcmMoving);
niiMoving2 = make_nii(dcmMoving2);
%%
parentDir = 'niftiFilesPt1/';
save(strcat(parentDir,'dcmVars.mat'),'fixedSlope','fixedInt',...
    'movingSlope','movingSlope2','movingInt','movingInt2');
%%
save_nii(niiFixed,strcat(parentDir,'fixed_5007.nii'));
save_nii(niiMoving,strcat(parentDir,'moving_5008.nii'));
save_nii(niiMoving2,strcat(parentDir,'moving_5009.nii'));

%%


parentDir = 'niftiFilesPt1/';

niiFixed = load_nii(strcat(parentDir,'fixed_5007.nii'));
niiMoving = load_nii(strcat(parentDir,'moving_5008.nii'));
niiMoving2 = load_nii(strcat(parentDir,'moving_5009.nii'));
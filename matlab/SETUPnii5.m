parentDir = 'timeSeriesPt2_5014-5016/';
fixedFolderName = strcat(parentDir,'Xper_CT_Abd_Thx_VFast_LDser_5014/');
movingFolderName = strcat(parentDir,'Xper_CT_Abd_Thx_VFast_LDser_5015/');
movingFolderName2 = strcat(parentDir,'Xper_CT_Abd_Thx_VFast_LDser_5016/');

[~,dcmFixed,~,fixedSlope,fixedInt] = getDCMFolderData(fixedFolderName);
[~,dcmMoving,~,movingSlope,movingInt] = getDCMFolderData(movingFolderName);
[~,dcmMoving2,~,movingSlope2,movingInt2] = getDCMFolderData(movingFolderName2);

niiFixed = make_nii(dcmFixed);
niiMoving = make_nii(dcmMoving);
niiMoving2 = make_nii(dcmMoving2);
%%
parentDir = 'niftiFilesPt2/';
save(strcat(parentDir,'dcmVars.mat'),'fixedSlope','fixedInt',...
    'movingSlope','movingSlope2','movingInt','movingInt2');
%%
save_nii(niiFixed,strcat(parentDir,'fixed_5014.nii'));
save_nii(niiMoving,strcat(parentDir,'moving_5015.nii'));
save_nii(niiMoving2,strcat(parentDir,'moving_5016.nii'));

%%


parentDir = 'niftiFilesPt1/';

niiFixed = load_nii(strcat(parentDir,'fixed_5007.nii'));
niiMoving = load_nii(strcat(parentDir,'moving_5008.nii'));
niiMoving2 = load_nii(strcat(parentDir,'moving_5009.nii'));
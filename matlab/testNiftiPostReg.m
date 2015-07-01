parentDir = 'niftiFiles/';

niiFixed = load_nii(strcat(parentDir,'fixed_5005.nii'));
niiMoving = load_nii(strcat(parentDir,'moving_5007_registered.nii'));
niiMoving2 = load_nii(strcat(parentDir,'moving_5006_registered.nii'));

%niiFixed = load_nii(strcat(parentDir,'fixed_5005_noArtifacts.nii'));
%niiMoving = load_nii(strcat(parentDir,'moving_5006_noArtifacts.nii'));

%niiFixed = load_nii(strcat(parentDir,'fixed_5005_noArtifacts.nii'));
%niiMoving = load_nii(strcat(parentDir,'moving_5006_noArtifacts_registered.nii'));
%niiMoving = load_nii('outputResult.nii');

%niiFixed = load_nii(strcat(parentDir,'fixedThreshHU_5005.nii'));
%niiMoving = load_nii(strcat(parentDir,'movingThreshHU_5006_registered.nii'));
%niiMoving = load_nii(strcat(parentDir,'movingThreshHU_5007_registered.nii'));

%niiMoving2RegCPP = read_nifti_hdr(strcat(parentDir,'moving_5007_cpp.nii'));

fixedImg = niiFixed.img;
movingImg = niiMoving.img;
movingImg2 = niiMoving2.img;
%%
imtool3D(fixedImg-movingImg);

%{
parentDir = 'niftiFiles/';
niiFixed = load_nii(strcat(parentDir,'fixedThresh_5005.nii'));
niiMoving2Reg = load_nii(strcat(parentDir,'movingThresh_5007_registered.nii'));

fixedImg = niiFixed.img;
movingImg = niiMoving2Reg.img;
%}

%%
h = figure('Name','Registration on Original Images');
imtool3D(fixedImg+movingImg,[0 0 1 1],h);

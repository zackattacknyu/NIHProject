parentDir = 'niftiFiles/';
niiFixed = load_nii(strcat(parentDir,'fixed_5005.nii'));
niiMoving2Reg = load_nii(strcat(parentDir,'moving_5007_registered.nii'));
%%
niiMoving2RegCPP = read_nifti_hdr(strcat(parentDir,'moving_5007_cpp.nii'));
%%
fixedImg = niiFixed.img;
movingImg = niiMoving2Reg.img;
imtool3D(fixedImg-movingImg);
%%

%{
parentDir = 'niftiFiles/';
niiFixed = load_nii(strcat(parentDir,'fixedThresh_5005.nii'));
niiMoving2Reg = load_nii(strcat(parentDir,'movingThresh_5007_registered.nii'));

fixedImg = niiFixed.img;
movingImg = niiMoving2Reg.img;
imtool3D(fixedImg+movingImg);
%}
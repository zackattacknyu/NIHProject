parentDir = 'niftiFiles/';

niiFixed = load_nii(strcat(parentDir,'fixed_5005.nii'));
niiMoving = load_nii(strcat(parentDir,'moving_5006.nii'));
niiMoving2 = load_nii(strcat(parentDir,'moving_5007.nii'));
niiMovingReg = load_nii(strcat(parentDir,'moving_5006_registered.nii'));
niiMovingReg2 = load_nii(strcat(parentDir,'moving_5007_registered.nii'));

fixedImg = niiFixed.img;
movingImg = niiMoving.img;
movingImg2 = niiMoving2.img;
movingImg3 = niiMovingReg.img;
movingImg4 = niiMovingReg2.img;

arrSize = size(fixedImg);
fixedImgNoArt = zeros(arrSize);
movingImgNoArt = zeros(arrSize);
movingImg2NoArt = zeros(arrSize);
movingImg3NoArt = zeros(arrSize);
movingImg4NoArt = zeros(arrSize);
for k = 1:arrSize(3)
    k
    fixedImgNoArt(:,:,k) = getImgArtifactsRemoved(fixedImg(:,:,k));
    movingImgNoArt(:,:,k) = getImgArtifactsRemoved(movingImg(:,:,k));
    movingImg2NoArt(:,:,k) = getImgArtifactsRemoved(movingImg2(:,:,k));
    movingImg3NoArt(:,:,k) = getImgArtifactsRemoved(movingImg3(:,:,k));
    movingImg4NoArt(:,:,k) = getImgArtifactsRemoved(movingImg4(:,:,k));
end

niiFixedNoArt = make_nii(fixedImgNoArt);
niiMovingNoArt = make_nii(movingImgNoArt);
niiMoving2NoArt = make_nii(movingImg2NoArt);
niiMoving3NoArt = make_nii(movingImg3NoArt);
niiMoving4NoArt = make_nii(movingImg4NoArt);

parentDirSave = 'niftiFiles2/';
save_nii(niiFixedNoArt,strcat(parentDirSave,'fixed_5005_noArtifacts.nii'));
save_nii(niiMovingNoArt,strcat(parentDirSave,'moving_5006_noArtifacts.nii'));
save_nii(niiMoving2NoArt,strcat(parentDirSave,'moving_5007_noArtifacts.nii'));
save_nii(niiMoving3NoArt,strcat(parentDirSave,'moving_5006_reg_noArtifacts.nii'));
save_nii(niiMoving4NoArt,strcat(parentDirSave,'moving_5007_reg_noArtifacts.nii'));
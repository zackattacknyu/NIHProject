dcmFixedHUnoArt = zeros(size(dcmFixedHU));
dcmMovingHUnoArt = zeros(size(dcmMovingHU));
dcmMoving2HUnoArt = zeros(size(dcmMoving2HU));
for k = 1:size(dcmFixedHU,3)
    dcmFixedHUnoArt(:,:,k) = getImgArtifactsRemoved(dcmFixedHU(:,:,k));
    dcmMovingHUnoArt(:,:,k) = getImgArtifactsRemoved(dcmMovingHU(:,:,k));
    dcmMoving2HUnoArt(:,:,k) = getImgArtifactsRemoved(dcmMoving2HU(:,:,k));
    k
end

niiFixedNoArt = make_nii(dcmFixedHUnoArt);
niiMovingNoArt = make_nii(dcmMovingHUnoArt);
niiMoving2NoArt = make_nii(dcmMoving2HUnoArt);

parentDir = 'niftiFiles/';
save_nii(niiFixedNoArt,strcat(parentDir,'fixed_5005_noArtifacts.nii'));
save_nii(niiMovingNoArt,strcat(parentDir,'moving_5006_noArtifacts.nii'));
save_nii(niiMoving2NoArt,strcat(parentDir,'moving_5007_noArtifacts.nii'));
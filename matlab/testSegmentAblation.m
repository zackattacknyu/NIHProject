%niiCur = load_nii('Pt8ConvDiffVolumes/vol5002_5003_seg2.nii');
niiCur = load_nii('Pt8ConvDiffVolumes/vol5002_5004_seg.nii');
curSeg = changeSegImageCoords(single(niiCur.img));

%%
%sliceNum = 210;
sliceNum = 144;
%segSlice = curSeg(:,:,sliceNum);
%segSlice = fixedImg(:,:,sliceNum);
diffSlice = fixedImg(:,:,sliceNum);
segSlice = diffImageConv(:,:,sliceNum);
sliceColored = zeros([size(segSlice) 3]);
sliceColored(:,:,1)=putin01scale(segSlice);
sliceColored(:,:,3)=1-putin01scale(diffSlice);
figure
imshow(sliceColored);
title('Original Image with segmented ablation zone from comparison 1');

%%

save_nii(make_nii(curSeg),'Pt8ConvDiffVolumes/vol5002_5004_segMod.nii');
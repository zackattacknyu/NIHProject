rInds = 64:126; cInds = 104:166; zInds = 200:230;
diffFrameAll = zeros(size(fixedImg));
diffFrameAll(rInds,cInds,zInds)=sqrt(diffFrameBlock);
niiDiff = make_nii(diffFrameAll);
save_nii(niiDiff,'pt8_3DOverlayFiles/diffBlockAll_5002_5003.nii');
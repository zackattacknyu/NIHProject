goodValsMask = find(fixedImg<0 | fixedImg>1000);
goodValsMask2 = find(movingImg3<0 | movingImg3>1000);
diffImage = movingImg3-fixedImg;
diffImage(goodValsMask)=0;
diffImage(goodValsMask2)=0;
diffImage(diffImage<-200)=0;
diffImage(diffImage>200)=0;
%%

diffImage(diffImage<0)=0;
diffImageConv(diffImageConv<0)=0;

%%
diffImageConv = movingImgA-fixedImgA;
diffImageConv(goodValsMask)=0;
diffImageConv(goodValsMask2)=0;
diffImageConv(diffImageConv<-200)=0;
diffImageConv(diffImageConv>200)=0;


%%
%metal is over 2000 HU
nonMetalMask = find(fixedImg<2000);
fixedImgMetal = fixedImg;
fixedImgMetal(nonMetalMask)=2000;

%%

nonFatMask = find(fixedImg<-100 | fixedImg>0);
fixedImgFat = fixedImg;
fixedImgFat(nonFatMask)=-100;

%%

nonSoftTissueMask = find(fixedImg<100 | fixedImg>500);
fixedImgSoftTissue = fixedImg;
fixedImgSoftTissue(nonSoftTissueMask)=100;

nonSoftTissueMask2 = find(movingImg3<100 | movingImg3>500);
movingImg3SoftTissue = movingImg3;
movingImg3SoftTissue(nonSoftTissueMask2)=100;

%%
nonTissueMask = find(fixedImg<-100 | fixedImg>100);
fixedImgTissue = fixedImg;
fixedImgTissue(nonTissueMask)=-100;

nonTissueMask2 = find(movingImg3<-100 | movingImg3>100);
movingImg3Tissue = movingImg3;
movingImg3Tissue(nonTissueMask2)=-100;
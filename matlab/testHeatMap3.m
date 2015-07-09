%{
fixedImgA = fixedImg(:,:,59);
movingImgA = movingImg3(:,:,59);
fixedImgFiltered = getImgArtifactsRemoved(fixedImgA);
movingImgFiltered = getImgArtifactsRemoved(movingImgA);
%}

%{
fixedImgFiltered = putInMinMaxRange(fixedImgFiltered,-100,200);
movingImgFiltered = putInMinMaxRange(movingImgFiltered,-100,200);
%}

%{
fixedImgA = putInMinMaxRange(fixedImg,-100,200);
movingImgA = putInMinMaxRange(movingImg3,-100,200);
movingImgB = putInMinMaxRange(movingImg4,-100,200);
%}
avgFilter = zeros(3,3,3);
for i = 1:3
   avgFilter(:,:,i) = fspecial('average',3); 
end
%%
fixedImgA = convn(fixedImg,avgFilter,'same');
movingImgA = convn(movingImg3,avgFilter,'same');
%movingImgB = convn(movingImg4,avgFilter,'same');
%%

%pixels that are not soft tissue
mask = find(fixedImg<-200 | fixedImg>200);
maskRaw = find(movingImg<-200 | movingImg>200);
maskReg = find(movingImg3<-200 | movingImg3>200);

diffImage5006Raw = movingImg-fixedImg;
diffImage5006Raw(mask) = 0;
diffImage5006Raw(maskRaw) = 0;

diffImage5006Reg = movingImg3-fixedImg;
diffImage5006Reg(mask) = 0;
diffImage5006Reg(maskReg) = 0;
%%

diffImage5006RegNoArt = get3DImgArtifactsRemoved(diffImage5006Reg);
diffImage5006RawNoArt = get3DImgArtifactsRemoved(diffImage5006Raw);

%%

diffImage5006Raw = convn(diffImage5006Raw,avgFilter,'same');
diffImage5006Reg = convn(diffImage5006Reg,avgFilter,'same');


%%
fixedImgFilteredA = putInMinMaxRange(fixedImgFiltered,-100,400);
movingImgFilteredA = putInMinMaxRange(movingImgFiltered,-100,400);

%%

fixedImgFilteredA = conv2(fixedImgFilteredA,fspecial('average',3));
movingImgFilteredA = conv2(movingImgFilteredA,fspecial('average',3));

diffImage = movingImgFiltered-fixedImgFiltered;
%%
imtool3D(diffImage);
imtool3D(abs(diffImage));
imtool3D(diffImage.^2);

%%
diffImageA = movingImgA-fixedImgA;
diffImageB = movingImgB-fixedImgA;
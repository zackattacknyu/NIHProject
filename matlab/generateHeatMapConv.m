fSize=8; %for Pt 9, Pt 8, Pt1
%fSize=4; %for Pt4
wSize = 1;
%%

%for Pt 9, baseline 1
%sliceNum=144;
%temps = [108 5 10 0];

%for Pt 8, baseline 1
sliceNum=210;
temps = [64 0 14 1];

%for Pt4, baseline 1
%sliceNum = 117;
%temps = [28 20 31 21];

%for Pt 1, slice 51 seems to have the zone
%   the thermocouples though appear in later slices

%for Pt2, it seems to appear around 47,
%   but the conv difference is faint


%%
fixedImgConv = getAverageFilteredBlocks(fixedImg,fSize);
movingImgConv = getAverageFilteredBlocks(movingImg3,fSize);
movingImgConv2 = getAverageFilteredBlocks(movingImg4,fSize);

diffImageConv=fixedImgConv-movingImgConv;
diffImageConv2=fixedImgConv-movingImgConv2;

%diffImageConv2 = putInMinMaxRange(fixedImgConv-movingImgConv2,-1000,1000);
%diffImageConv = putInMinMaxRange(fixedImgConv-movingImgConv,-1100,1100);
%%
%the fixed image is what we use to get coords for thermocouple,
fixedImgSlice = fixedImg(:,:,sliceNum);

%the diff image will give us the ablation zone
curImage = diffImageConv(:,:,sliceNum);
curImage2 = diffImageConv2(:,:,sliceNum);

[diffVals,tempVals] = getDiffTempVals(fixedImgSlice,curImage,curImage,curImage2,wSize,temps);
%%

degree=1;
[coeff,xx,yy] = generateRegressionOutput(diffVals,tempVals,degree);
figure
plot(xx,yy);
hold on
plot(diffVals,tempVals,'rx');
hold off

%%
imtool3D(polyval(coeff,diffImageConv)+37);
imtool3D(polyval(coeff,diffImageConv2)+37);

%%
save('pt4TempData.mat')

%%

%TO BE RUN AFTER GENERATEHEATMAP[METHOD].M

sliceNum=210;
slice = diffImageConv(:,:,sliceNum);
initTemp = 37;
tempImage = polyval(coeff,slice)+initTemp;
figure
imagesc(tempImage);
colorbar;

[centerR centerC] = ginput;

%%

centR = floor(centerR); centC = floor(centerC);
numR = size(slice,1);
numC = size(slice,2);
[rr, cc] = meshgrid(1:numR,1:numC);
numRadii=80;
averageTemps = zeros(1,numRadii);
for curRadius = 1:numRadii
    includeMat = single((rr-centR).^2 + (cc-centC).^2 <= curRadius^2);
    
    tempImageWithInc = tempImage.*includeMat;

    tempsInRegion = tempImageWithInc(:); 
    tempsInRegion = tempsInRegion(tempsInRegion>0);
    averageTemps(curRadius) = mean(tempsInRegion);
end

plot(averageTemps);


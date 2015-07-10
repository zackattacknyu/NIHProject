fSize=8;
fixedImgConv = getAverageFilteredBlocks(fixedImg,fSize);
movingImgConv = getAverageFilteredBlocks(movingImg3,fSize);
movingImgConv2 = getAverageFilteredBlocks(movingImg4,fSize);
%%
diffImageConv2 = putInMinMaxRange(fixedImgConv-movingImgConv2,-1000,1000);
diffImageConv = putInMinMaxRange(fixedImgConv-movingImgConv,-1100,1100);
%%

%slice 144 has the ablation
% we use ginput to get the coords
sliceNum=144;
wSize = 1;
%the fixed image is what we use to get coords for thermocouple,
%       where the temp increased by 5
fixedImgSlice = fixedImg(:,:,sliceNum);

%the diff image will give us the ablation zone
%       where temp increased by 108
curImage = diffImageConv(:,:,sliceNum);

curImage2 = diffImageConv2(:,:,sliceNum);

temps = [108 5 10 0];

[diffVals,tempVals] = getDiffTempVals(fixedImgSlice,curImage,curImage,curImage2,wSize,temps);
%%
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
save('pt1TempData.mat')


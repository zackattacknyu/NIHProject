%{

%8 seems to be a good filter size
for size=4:9
   imgFiltered = getAverageFilteredBlocks(fixedImg,size);
   imtool3D(imgFiltered);
end

%}
%%

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

%the fixed image is what we use to get coords for thermocouple,
%       where the temp increased by 5
fixedImgSlice = fixedImg(:,:,sliceNum);
figure
imagesc(fixedImgSlice)
[x, y] = ginput;
wSize=1; center = floor([y(1) x(1)]);
%%
[rowCoords,colCoords]=meshgrid(center(1)-wSize:1:center(1)+wSize,center(2)-wSize:1:center(2)+wSize);
controlInds = sub2ind(size(fixedImgSlice),rowCoords(:),colCoords(:));
%%

%the diff image will give us the ablation zone
%       where temp increased by 108
curImage = diffImageConv(:,:,sliceNum);
figure
imagesc(curImage);
[x,y] = ginput;
center = floor([y(1) x(1)]);
[rowCoords,colCoords]=meshgrid(center(1)-wSize:1:center(1)+wSize,center(2)-wSize:1:center(2)+wSize);
ablationInds = sub2ind(size(curImage),rowCoords(:),colCoords(:));

%%
curImage2 = diffImageConv2(:,:,sliceNum);
diffValsAblation = curImage(ablationInds);
diffValsControl = curImage(controlInds);
diffValsAblation2 = curImage2(ablationInds);
diffValsControl2 = curImage2(controlInds);

%%

diffVals = [diffValsAblation;diffValsControl;diffValsAblation2;diffValsControl2];
tempVals = [108*ones(length(diffValsAblation),1);5*ones(length(diffValsControl),1)...
    ;10*ones(length(diffValsAblation2),1);zeros(length(diffValsControl2),1)];


%%

coeff = polyfit(diffVals,tempVals,1);
xx = linspace(min(diffVals),max(diffVals),20);
yy = polyval(coeff,xx);
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


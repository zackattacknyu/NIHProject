%{

%8 seems to be a good filter size
for size=4:9
   imgFiltered = getAverageFilteredBlocks(fixedImg,size);
   imtool3D(imgFiltered);
end

%}
%%

fSize=8;
imgNum=144;
fixedSlice = fixedImg(:,:,imgNum);

movingSlice = movingImg3(:,:,imgNum);
movingSlice2 = movingImg4(:,:,imgNum);

diffFrame = slidingWindowSquDiff(fixedSlice,movingSlice,fSize);
diffFrame2 = slidingWindowSquDiff(fixedSlice,movingSlice2,fSize);

%%

%slice 144 has the ablation
% we use ginput to get the coords
sliceNum=144;

%size of window to get ablation values
wSize=2;

%the fixed image is what we use to get coords for thermocouple,
%       where the temp increased by 5
fixedImgSlice = fixedImg(:,:,sliceNum);
figure
imagesc(fixedImgSlice)
[x, y] = ginput;
center = floor([y(1) x(1)]);
[rowCoords,colCoords]=meshgrid(center(1)-wSize:1:center(1)+wSize,center(2)-wSize:1:center(2)+wSize);
controlInds = sub2ind(size(fixedImgSlice),rowCoords(:),colCoords(:));
%%

%curImage = diffFrame;
%curImage2 = diffFrame2;
curImage = sqrt(diffFrame);
curImage2 = sqrt(diffFrame2);
%%
%the diff image will give us the ablation zone
%       where temp increased by 108

figure
imagesc(curImage);
[x,y] = ginput;
center = floor([y(1) x(1)]);
[rowCoords,colCoords]=meshgrid(center(1)-wSize:1:center(1)+wSize,center(2)-wSize:1:center(2)+wSize);
ablationInds = sub2ind(size(curImage),rowCoords(:),colCoords(:));

%%
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
xlabel('RMSE for Window');
ylabel('Temperatue Change from Baseline');
hold off
%%
imtool3D(polyval(coeff,curImage)+37);
imtool3D(polyval(coeff,curImage2)+37);

%%
save('pt1TempData.mat')


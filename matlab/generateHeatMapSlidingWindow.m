%slice 144 has the ablation
% we use ginput to get the coords
imgNum=144;

%size of window to get ablation values
wSize=1;
fSize=4;

fixedSlice = fixedImg(:,:,imgNum);
movingSlice = movingImg3(:,:,imgNum);
movingSlice2 = movingImg4(:,:,imgNum);

diffFrame = slidingWindowSquDiff(fixedSlice,movingSlice,fSize);
diffFrame2 = slidingWindowSquDiff(fixedSlice,movingSlice2,fSize);
%%
diffFrameR = sqrt(diffFrame);
diffFrameR2 = sqrt(diffFrame2);

temps = [108 5 10 0];

[diffVals,tempVals] = getDiffTempVals(fixedSlice,diffFrameR,diffFrameR,diffFrameR2,wSize,temps);

%%

degree=1;
[coeff,xx,yy] = generateRegressionOutput(diffVals,tempVals,degree);
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


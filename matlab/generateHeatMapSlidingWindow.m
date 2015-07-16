%slice 144 has the ablation for Pt 9
%imgNum=144;
%rInds=181:242;cInds=133:204;zInds=120:145;

%clear all
%SETUP3
%slice 117 has the ablation for Pt 4, baseline 1  
%imgNum=117;
%rInds=60:130;cInds=1:80;zInds=100:140;
%%
%clear all
%SETUP2
%slice 210 has ablation for Pt 8, baseline 1
%imgNum=210;
%rInds = 60:130; cInds = 100:170; zInds = 200:230;

%size of window to get ablation values
wSize=1;
fSize=4;

fixedROI = fixedImg(rInds,cInds,zInds);
movingROI = movingImg3(rInds,cInds,zInds);
movingROI2 = movingImg4(rInds,cInds,zInds);
diffROI = diffImageConv(rInds,cInds,zInds);
diffROI2 = diffImageConv2(rInds,cInds,zInds);

%%
diffFrameBlock = getSlidingWindowBlocks(fixedROI,movingROI,fSize);
diffFrameBlock2 = getSlidingWindowBlocks(fixedROI,movingROI2,fSize);

%%
%diffFrame = slidingWindowSquDiff(fixedROI(:,:,11),movingROI(:,:,11),fSize);
%diffFrame2 = slidingWindowSquDiff(fixedROI(:,:,11),movingROI2(:,:,11),fSize);
diffFrame = diffFrameBlock(:,:,18);
diffFrame2 = diffFrameBlock2(:,:,18);

diffFrameR = sqrt(diffFrame);
diffFrameR2 = sqrt(diffFrame2);
fixedSlice = fixedImg(rInds,cInds,117);

%temps = [108 5 10 0];
temps = [28 20 31 21]; %for Pt4

[diffVals,tempVals] = getDiffTempVals(fixedSlice,diffFrameR,diffFrameR,diffFrameR2,wSize,temps);

%%

degree=1;
[coeff,xx,yy] = generateRegressionOutput(diffVals,tempVals,degree);
figure
plot(xx,yy);
hold on
plot(diffVals,tempVals,'rx');
xlabel('Sliding Window Value');
ylabel('Temperatue Change');
hold off
%%
imtool3D(polyval(coeff,curImage)+37);
imtool3D(polyval(coeff,curImage2)+37);

%%
save('pt4TempData_slidingWindowDiff.mat')


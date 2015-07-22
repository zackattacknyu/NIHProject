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
%%
fixedROI = fixedImg(rInds,cInds,zInds);
movingROI = movingImg3(rInds,cInds,zInds);
movingROI2 = movingImg4(rInds,cInds,zInds);
diffROI = diffImageConv(rInds,cInds,zInds);
diffROI2 = diffImageConv2(rInds,cInds,zInds);

%%
diffFrameBlock = getSlidingWindowBlocks(fixedROI,movingROI,fSize);
diffFrameBlock2 = getSlidingWindowBlocks(fixedROI,movingROI2,fSize);

%%

diffFrameBlock = diffFrameBlocks{1};
diffFrameBlock2 = diffFrameBlocks{2};
%%
%diffFrame = slidingWindowSquDiff(fixedROI(:,:,11),movingROI(:,:,11),fSize);
%diffFrame2 = slidingWindowSquDiff(fixedROI(:,:,11),movingROI2(:,:,11),fSize);

%diffFrame = diffFrameBlock(:,:,29);
%diffFrame2 = diffFrameBlock2(:,:,29);

%{
diffFrameR = sqrt(diffFrame);
diffFrameR2 = sqrt(diffFrame2);
fixedSlice = fixedImg(rInds,cInds,128);
%}

%for pt5, baseline 1
%ablationSliceNum=19;
%controlSliceNum=8;

%for pt5, baseline 3
%ablationSliceNum=12;
%controlSliceNum=20;

%for pt 6, baseline 1
%sliceNum=178;
%indImages = repmat({sqrt(diffFrameBlock(:,:,sliceNum))},1,3);
%diffImages = repmat({sqrt(diffFrameBlock(:,:,sliceNum)) sqrt(diffFrameBlock2(:,:,sliceNum))},3,1);

%for pt 8, baseline 1
%sliceNum=210;
sliceNum=11;
indImages = repmat({sqrt(diffFrameBlock(:,:,sliceNum))},1,2);
diffImages = repmat({sqrt(diffFrameBlock(:,:,sliceNum)) sqrt(diffFrameBlock2(:,:,sliceNum))},2,1);

%for pt 3, baseline 1
%{
sliceNum1 = 83;
sliceNum2 = 79;
sliceNum3 = 88;
indImages = {sqrt(diffFrameBlock(:,:,sliceNum1)) ...
    sqrt(diffFrameBlock(:,:,sliceNum2)) ...
    sqrt(diffFrameBlock(:,:,sliceNum3))};
diffImages = {sqrt(diffFrameBlock(:,:,sliceNum1)) sqrt(diffFrameBlock2(:,:,sliceNum1));...
    sqrt(diffFrameBlock(:,:,sliceNum2)) sqrt(diffFrameBlock2(:,:,sliceNum2));...
    sqrt(diffFrameBlock(:,:,sliceNum3)) sqrt(diffFrameBlock2(:,:,sliceNum3))};
%}

%diffFrameAblation = sqrt(diffFrameBlock(:,:,ablationSliceNum));
%diffFrameAblation2 = sqrt(diffFrameBlock2(:,:,ablationSliceNum));
%diffFrameControl = sqrt(diffFrameBlock(:,:,controlSliceNum));
%diffFrameControl2 = sqrt(diffFrameBlock2(:,:,controlSliceNum));

%temps = [108 5 10 0]; %for Pt 9
%temps = [28 20 31 21]; %for Pt4
%temps = [23 3 31 23]; %for Pt 5, baseline 1
%temps = [47 10 59 14]; %for Pt 5, baseline 3
%temps = [101 95;93 76;15 68]; %for Pt 6, baseline 1
%temps = [18 23;11 6;14 15]; %for Pt 3, baseline 1
temps = [64 0;14 1]; %for Pt 8, baseline 1

%[diffVals,tempVals] = getDiffTempVals(fixedSlice,diffFrameR,diffFrameR,diffFrameR2,wSize,temps);

%[diffVals,tempVals] = getDiffTempVals2(diffFrameControl,diffFrameAblation,...
%    diffFrameControl,diffFrameAblation,diffFrameControl2,diffFrameAblation2,wSize,temps);

[diffVals,tempVals] = getDiffTempVals3(indImages,diffImages,wSize,temps);

%%

degree=1;
[coeff,xx,yy] = generateRegressionOutput(diffVals,tempVals,degree);
figure
plot(xx,yy);
hold on
plot(diffVals,tempVals,'rx');
xlabel('Sliding Window RMSE');
ylabel('Temperature Change (Celsius)');
hold off
%%
imtool3D(polyval(coeff,curImage)+37);
imtool3D(polyval(coeff,curImage2)+37);

%%
%save('pt4TempData_slidingWindowDiff.mat')
%save('pt5b1TempData_slidingWindowDiff.mat')
%save('pt6b1TempData_slidingWindowDiff.mat')
save('pt3b1TempData_slidingWindowDiff.mat')


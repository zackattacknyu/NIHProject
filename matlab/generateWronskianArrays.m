parentDir = 'niftiFiles/';

niiFixed = load_nii(strcat(parentDir,'fixed_5005.nii'));
niiMoving = load_nii(strcat(parentDir,'moving_5006.nii'));
niiMoving2 = load_nii(strcat(parentDir,'moving_5007.nii'));
niiMovingReg2 = load_nii(strcat(parentDir,'moving_5007_registered.nii'));

continueFlag = 0;
while(continueFlag==0)
    try
        niiMovingReg = load_nii(strcat(parentDir,'moving_5006_registered.nii'));
        continueFlag = 1;
    catch
        
    end
end

fixedImg = niiFixed.img;
movingImg = niiMoving.img;
movingImg2 = niiMoving2.img;
movingImg3 = niiMovingReg.img;
movingImg4 = niiMovingReg2.img;

baselineStack = fixedImg;
compareStack = movingImg;
compareStack2 = movingImg2;
compareStack3 = movingImg3;
compareStack4 = movingImg4;
sR=1;

stackSize = size(compareStack);
numSlices = stackSize(3);

numRowsWFrame = stackSize(1)-2*sR;
numColWFrame = stackSize(2)-2*sR;
wronskianArray = zeros(numRowsWFrame,numColWFrame,numSlices);
wronskianArray2 = zeros(numRowsWFrame,numColWFrame,numSlices);
wronskianArray3 = zeros(numRowsWFrame,numColWFrame,numSlices);
wronskianArray4 = zeros(numRowsWFrame,numColWFrame,numSlices);
for k = 1:numSlices
    baselineFrame = baselineStack(:,:,k);
    comparisonFrame = compareStack(:,:,k);
    comparisonFrame2 = compareStack2(:,:,k);
    comparisonFrame3 = compareStack3(:,:,k);
    comparisonFrame4 = compareStack4(:,:,k);
    wronskianArray(:,:,k) = wronskian(baselineFrame,comparisonFrame,sR,1);
    wronskianArray2(:,:,k) = wronskian(baselineFrame,comparisonFrame2,sR,1);
    wronskianArray3(:,:,k) = wronskian(baselineFrame,comparisonFrame3,sR,1);
    wronskianArray4(:,:,k) = wronskian(baselineFrame,comparisonFrame4,sR,1);
    k
end
%%
maxVal = 15;
wronskian1 = getModifiedWronskian(wronskianArray,maxVal);
wronskian2 = getModifiedWronskian(wronskianArray2,maxVal);
wronskian3 = getModifiedWronskian(wronskianArray3,maxVal);
wronskian4 = getModifiedWronskian(wronskianArray4,maxVal);

%%

h1 = figure('Name','5006, no registration');
imtool3D(wronskian1,[0 0 1 1],h1);
%h2 = figure('Name','5007, no registration');
%imtool3D(wronskian2,[0 0 1 1],h2);
h3 = figure('Name','5006, after NiftyReg');
imtool3D(wronskian3,[0 0 1 1],h3);
%h4 = figure('Name','5007, after NiftyReg');
%imtool3D(wronskian4,[0 0 1 1],h4);
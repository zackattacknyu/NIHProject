baselineStack = dcmRawFixed;
compareStack = dcmRawMoving2;
compareStack2 = dcmRawMovingReg2;
sR=1;

stackSize = size(compareStack);
numSlices = stackSize(3);

numRowsWFrame = stackSize(1)-2*sR;
numColWFrame = stackSize(2)-2*sR;
wronskianArray = zeros(numRowsWFrame,numColWFrame,numSlices);
diffArray = zeros(stackSize);
wronskianArray2 = zeros(numRowsWFrame,numColWFrame,numSlices);
diffArray2 = zeros(stackSize);
for k = 1:numSlices
    baselineFrame = baselineStack(:,:,k);
    comparisonFrame = compareStack(:,:,k);
    comparisonFrame2 = compareStack2(:,:,k);
    wronskianArray(:,:,k) = wronskian(baselineFrame,comparisonFrame,sR);
    wronskianArray2(:,:,k) = wronskian(baselineFrame,comparisonFrame2,sR);
    diffArray(:,:,k) = baselineFrame-comparisonFrame;
    diffArray2(:,:,k) = baselineFrame-comparisonFrame2;
    k
end
%%
imtool3D(wronskianArray);
imtool3D(diffArray);
imtool3D(wronskianArray2);
imtool3D(diffArray2);
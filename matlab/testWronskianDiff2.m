%baselineStack = dcmRawFixed;
%compareStack = dcmRawMoving2;
baselineStack = fixedImg;
compareStack = movingImg;
sR=1;

stackSize = size(compareStack);
numSlices = stackSize(3);

numRowsWFrame = stackSize(1)-2*sR;
numColWFrame = stackSize(2)-2*sR;
wronskianArray = zeros(numRowsWFrame,numColWFrame,numSlices);
for k = 1:numSlices
    baselineFrame = baselineStack(:,:,k);
    comparisonFrame = compareStack(:,:,k);
    wronskianArray(:,:,k) = wronskian(baselineFrame,comparisonFrame,sR,1);
    k
end
%%
diffArray = baselineStack-compareStack;

%{
imtool3D(wronskianArray);
imtool3D(diffArray);
imtool3D(wronskianArray(100:382,:,:));
%}
%%
maxVal = 3;
wronskianArray1 = wronskianArray;
wronskianArray1(wronskianArray1>maxVal)=maxVal;

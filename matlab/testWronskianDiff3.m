baselineStack = dcmRawFixed;
compareStack = dcmRawMoving2;
compareStack2 = dcmRawMovingReg2;
sR=1;

stackSize = size(compareStack);
numSlices = stackSize(3);

epsilon = 1;

numRowsWFrame = stackSize(1)-2*sR;
numColWFrame = stackSize(2)-2*sR;
wronskianArray = zeros(numRowsWFrame,numColWFrame,numSlices);
diffArray = zeros(stackSize);
wronskianArray2 = zeros(numRowsWFrame,numColWFrame,numSlices);
diffArray2 = zeros(stackSize);
for k = 1:numSlices
    i = k;%i denotes index to read from. k is index to write to. 
    baselineFrame = baselineStack(:,:,i);
    comparisonFrame = compareStack(:,:,i);
    comparisonFrame2 = compareStack2(:,:,i);
    wronskianArray(:,:,k) = wronskian(baselineFrame,comparisonFrame,sR,epsilon);
    wronskianArray2(:,:,k) = wronskian(baselineFrame,comparisonFrame2,sR,epsilon);
    diffArray(:,:,k) = baselineFrame-comparisonFrame;
    diffArray2(:,:,k) = baselineFrame-comparisonFrame2;
    k
end
%%
imtool3D(wronskianArray);
imtool3D(diffArray);
imtool3D(wronskianArray2);
imtool3D(diffArray2);

upperThresh = 15;
wronskianArrayThresh = wronskianArray;
wronskianArray2Thresh = wronskianArray2;
wronskianArrayThresh(wronskianArrayThresh>upperThresh)=upperThresh;
wronskianArray2Thresh(wronskianArray2Thresh>upperThresh)=upperThresh;
imtool3D(wronskianArrayThresh);
imtool3D(wronskianArray2Thresh);

%{
wronskianArrayLog = wronskianArray;
wronskianArray2Log = wronskianArray2;
wronskianArrayLog(wronskianArrayLog<1e-4)=1e-4;
wronskianArray2Log(wronskianArray2Log<1e-4)=1e-4;
imtool3D(log(wronskianArrayLog));
imtool3D(log(wronskianArray2Log));
%}
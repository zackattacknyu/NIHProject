baselineStack = dcmThresholdFixed;
compareStack = moving_reg;
sR=3;

stackSize = size(moving_reg);
numSlices = stackSize(3);

numRowsWFrame = stackSize(1)-2*sR;
numColWFrame = stackSize(2)-2*sR;
wronskianArray = zeros(numRowsWFrame,numColWFrame,numSlices);
diffArray = zeros(stackSize);
for k = 1:numSlices
    baselineFrame = baselineStack(:,:,k);
    comparisonFrame = compareStack(:,:,k);
    wronskianArray(:,:,k) = wronskian(baselineFrame,comparisonFrame,sR);
    diffArray(:,:,k) = baselineFrame-comparisonFrame;
    k
end
%%
imtool3D(wronskianArray);
imtool3D(diffArray);

fixedROI = rand(100,100,100);
movingROI = rand(100,100,100);
fSize=4;
fSizeJava = java.lang.Integer(fSize);

numR = size(fixedROI,1)-2*fSize; 
numC = size(fixedROI,2)-2*fSize; 
numZ = size(fixedROI,3);

%%
diffFrameBlock = zeros(numR,numC,numZ);

img1Block = javaObject('java.util.ArrayList');
img2Block = javaObject('java.util.ArrayList');

for k=1:numZ
    fixedSlice = fixedROI(:,:,k);
    movingSlice = movingROI(:,:,k);
    
    img1=fixedSlice;
    img2=movingSlice;
    
    img1Java = javaArray('java.lang.Double',size(img1,1),size(img1,2));
    img2Java = javaArray('java.lang.Double',size(img2,1),size(img2,2));

    for i = 1:size(img1,1)
        for j = 1:size(img1,2)
            img1Java(i,j) = java.lang.Double(img1(i,j));
            img2Java(i,j) = java.lang.Double(img2(i,j)); 
        end
    end
    
    javaMethod('add',img1Block,img1Java);
    javaMethod('add',img2Block,img2Java);
    
    diffFrameBlock(:,:,k) = slidingWindowSquDiffJava(fixedSlice,movingSlice,fSize);
    k
end
%%

result = javaMethod('getWholeDiffBlock','WholeDiffBlock',img1Block,img2Block,fSizeJava);
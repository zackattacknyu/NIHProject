
fSize=4;

img1 = fixedImg(:,:,144);
img2 = movingImg3(:,:,144);
%%
curSlice = slidingWindowSquDiff(img1,img2,fSize);
%%

rInds=160:240;cInds=40:180;
img1 = fixedImg(rInds,cInds,144);
img2 = movingImg3(rInds,cInds,144);
fSize=2;
Nsteps = 10;
%%
diffImg1 = slidingWindowSquDiff(img1,img2,fSize);
diffImg2 = slidingWindowRandomWalk(img1,img2,fSize,Nsteps);
%%
figure
imagesc(sqrt([diffImg1 diffImg2]));

%%
numTests=1;
fSize=2;

diffBetweenGood = zeros(numTests,2);

for i = 1:numTests

    img1 = rand(40,25)*200;
    img2 = rand(40,25)*200;
    
    goodOne = slidingWindowSquDiff(img1,img2,fSize);

    i

end
%%

javaaddpath('D:\git\NIHProject\release\SlidingWindow\dist\SlidingWindow.jar');


%%

img1 = rand(40,40)*200;
img2 = rand(40,40)*200;


img1Java = javaArray('java.lang.Double',size(img1,1),size(img1,2));
img2Java = javaArray('java.lang.Double',size(img2,1),size(img2,2));

for i = 1:size(img1,1)
    for j = 1:size(img1,2)
        img1Java(i,j) = java.lang.Double(img1(i,j));
        img2Java(i,j) = java.lang.Double(img2(i,j)); 
    end
end
fSize=4;
fSizeJava = java.lang.Integer(fSize);

javaOne = javaMethod('getWholeDiffImage','slidingwindow.WholeDiffImage',img1Java,img2Java,fSizeJava);
canonOne = slidingWindowSquDiff(img1,img2,fSize);

figure
imagesc([javaOne canonOne]);
colorbar;

%%
numHoriz = 10;
numVert = 6;
numDispTotal = numHoriz*numVert;
numPatchesTotal = 700;
patches = cell(1,numPatchesTotal);
for i = 1:length(patches)
   patches{i} = javaMethod('generatePatch','generatepatches.GeneratePatches'...
    ,size,centerVariance,intsArray,numPassesArray);
end











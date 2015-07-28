
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


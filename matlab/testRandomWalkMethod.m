
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
numTests=10;
fSize=2;

diffBetweenGood = zeros(numTests,2);

for i = 1:numTests

    img1 = rand(40,25)*200;
    img2 = rand(40,25)*200;
    
    goodOne = slidingWindowSquDiff(img1,img2,fSize);
    walk1 = slidingWindowRandomWalk(img1,img2,fSize,5);
    walk2 = slidingWindowRandomWalk(img1,img2,fSize,10);
    %walk3 = slidingWindowRandomWalk(img1,img2,fSize,50);
    
    diffBetweenGood(i,1) = sqrt(mean(mean( (walk1-goodOne).^2 )));
    diffBetweenGood(i,2) = sqrt(mean(mean( (walk2-goodOne).^2 )));
    %diffBetweenGood(i,3) = sqrt(mean(mean( (walk3-goodOne).^2 )));
    i

end
%%

figure
semilogy(diffBetweenGood(1:5,1),'r-')
hold on
semilogy(diffBetweenGood(1:5,2),'g-')
legend('Random Walk of 5 steps','Random Walk of 10 steps');
hold off

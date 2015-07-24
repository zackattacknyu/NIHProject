%{

Monte Carlo methods won't work
We will try a random walk method instead

%}


numTests=100;
fSize=4;

img1 = fixedImg(:,:,144);
img2 = movingImg3(:,:,144);

img1Box = img1(fSize+1:end-fSize,fSize+1:end-fSize);
randLinIndices = randperm(numel(img1Box));
[rInd, cInd] = ind2sub(size(img1Box),randLinIndices(1:numTests));
rInd = rInd+fSize; cInd = cInd+fSize;

res1 = zeros(1,numTests);
res2 = zeros(1,numTests);
res3 = zeros(1,numTests);
res4 = zeros(1,numTests);
res5 = zeros(1,numTests);
res6 = zeros(1,numTests);

for i = 1:numTests
    %window1=rand(9,9)*4200;
    %window2=rand(9,9)*4200; 
    ii = rInd(i); jj = cInd(i); ss = fSize;
    window1 = img1((ii-ss):(ii+ss),(jj-ss):(jj+ss));
    window2 = img2((ii-ss):(ii+ss),(jj-ss):(jj+ss));
    
    res1(i)=getMinWindowSquDiff(window1,window2);
    res2(i)=getMinWindowSquDiffMonteCarlo(window1,window2,1); 
    res3(i)=getMinWindowSquDiffMonteCarlo(window1,window2,10); 
    res4(i)=getMinWindowSquDiffMonteCarlo(window1,window2,50); 
    res5(i)=getMinWindowSquDiffLNorm(window1,window2,Inf);
    res6(i)=getMinWindowSquDiffLNorm(window1,window2,1);
end

[vals,inds] = sort(res1);
inds2 = inds(vals>10);

figure
semilogy(res1(inds2),'r-')
hold on
%semilogy(res2(inds2),'b-')
%semilogy(res3(inds2),'k-')
%semilogy(res4(inds2),'c-')
semilogy(res5(inds2),'m-')
semilogy(res6(inds2),'g-')
%legend('Canonical Result (n=81)','Monte Carlo n=1','Monte Carlo n=10','Monte Carlo n=50','L Inf Norm','L1 Norm');
legend('Canonical Result (n=81)','L Inf Norm','L1 Norm');
hold off
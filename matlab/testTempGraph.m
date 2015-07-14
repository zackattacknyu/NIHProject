%TO BE RUN AFTER GENERATEHEATMAP[METHOD].M

sliceNum=210;
slice = diffImageConv(:,:,sliceNum);
initTemp = 37;
tempImage = polyval(coeff,slice)+initTemp;
figure
imagesc(tempImage);
colorbar;

[centerR centerC] = ginput;

%%

centR = floor(centerR); centC = floor(centerC);
numR = size(slice,1);
numC = size(slice,2);
[rr, cc] = meshgrid(1:numR,1:numC);
numRadii=80;
averageTemps = zeros(1,numRadii);
for curRadius = 1:numRadii
    includeMat = single((rr-centR).^2 + (cc-centC).^2 <= curRadius^2);
    
    tempImageWithInc = tempImage.*includeMat;

    tempsInRegion = tempImageWithInc(:); 
    tempsInRegion = tempsInRegion(tempsInRegion>0);
    averageTemps(curRadius) = mean(tempsInRegion);
end

plot(averageTemps);
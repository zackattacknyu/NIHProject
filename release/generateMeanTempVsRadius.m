%{
This generates the mean temperature vs radius graph

You need to specify the slice number and then you manually
    select the ablation center
%}

%MANUALLY INPUT SLICE NUMBER HERE
sliceNum=23;

tempImage = currentThermalMap(:,:,sliceNum);
figure
imagesc(tempImage);
colorbar;

[centerR, centerC] = ginput;

centR = floor(centerR(1)); centC = floor(centerC(1));
numR = size(tempImage,2);
numC = size(tempImage,1);
[rr, cc] = meshgrid(1:numR,1:numC);
maxRadii=60;
averageTemps = zeros(1,maxRadii+1);
for curRadius = 0:maxRadii
    includeMat = single((rr-centR).^2 + (cc-centC).^2 <= curRadius^2);
    
    tempImageWithInc = tempImage.*includeMat;

    tempsInRegion = tempImageWithInc(:); 
    tempsInRegion = tempsInRegion(tempsInRegion>0);
    averageTemps(curRadius+1) = mean(tempsInRegion);
end

figure
plot(0:maxRadii,averageTemps);
xlabel('Radius of Region centered at Ablation Zone (pixels)');
ylabel('Average Temperature in Region (Celcius)');

%{

THIS SECTION IS USED FOR THE PICTURES IN THE RESULTS SECTION

%}

%must be run after generateHeatMapConv
%       has done the regression

sliceNum=144;
rInds=140:260;cInds=40:210;
diffImageSlice = diffImageConv(:,:,sliceNum);
diffImageROI = diffImageSlice(rInds,cInds);
thermMapROI = polyval(coeff,diffImageROI);
thermMapROI(thermMapROI<0)=0;
thermMapROI = thermMapROI + 37;
figure
imagesc(thermMapROI)
colorbar;
axis off;

%%

%must be run after generateHeatMapSlidingWindow.m
%       has done the regression

thermMapROI = polyval(coeff,diffFrameR);
thermMapROI = thermMapROI + 37;
figure
imagesc(thermMapROI)
colorbar;
axis off;

%%

%TO BE RUN AFTER GENERATEHEATMAP[METHOD].M
%   GENERATES GRAPH OF MEAN TEMPERATURE VERSUS RADIUS

tempImage = thermMapROI;
figure
imagesc(tempImage);
colorbar;

[centerR, centerC] = ginput;

centR = floor(centerR); centC = floor(centerC);
numR = size(tempImage,2);
numC = size(tempImage,1);
[rr, cc] = meshgrid(1:numR,1:numC);
numRadii=60;
averageTemps = zeros(1,numRadii);
for curRadius = 1:numRadii
    includeMat = single((rr-centR).^2 + (cc-centC).^2 <= curRadius^2);
    
    tempImageWithInc = tempImage.*includeMat;

    tempsInRegion = tempImageWithInc(:); 
    tempsInRegion = tempsInRegion(tempsInRegion>0);
    averageTemps(curRadius) = mean(tempsInRegion);
end
%%
plot(averageTemps);
xlabel('Radius of Region centered at Ablation Zone (pixels)');
ylabel('Average Temperature in Region (Celcius)');

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
maxRadii=60;
averageTemps = zeros(1,maxRadii+1);
for curRadius = 0:maxRadii
    includeMat = single((rr-centR).^2 + (cc-centC).^2 <= curRadius^2);
    
    tempImageWithInc = tempImage.*includeMat;

    tempsInRegion = tempImageWithInc(:); 
    tempsInRegion = tempsInRegion(tempsInRegion>0);
    averageTemps(curRadius+1) = mean(tempsInRegion);
end
%%
figure
%plot(0:maxRadii,averageTemps);
plot(0:maxRadii,averageTempsConv,'r-');
hold on
plot(0:maxRadii,averageTempsSliding,'g-');
hold on
legend('Filtered Difference Method','Sliding Window Method');
xlabel('Radius of Region centered at Ablation Zone (pixels)');
ylabel('Average Temperature in Region (Celcius)');
%%

save('pt9_slidingWindowValues.mat')















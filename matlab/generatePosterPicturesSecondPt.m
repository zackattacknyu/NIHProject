%%
%{

THE FOLLOWING SECTION IS USED FOR THE CHANGE DETECTION PICTURES

%}


%this is done for Patient 4, so slice 117
sliceNum=117;
fixedSlice = fixedImg(:,:,sliceNum);
movingSlice = movingImg(:,:,sliceNum);
movingRegSlice = movingImg3(:,:,sliceNum);
%rawDiff = fixedSlice-movingSlice;
%rawDiffReg = fixedSlice-movingRegSlice;
figure
imagesc([fixedSlice movingRegSlice]);
rectX = 1; %starting col Index of ROI
rectY = 60; %ending row Index of ROI
sizeX = 80; %ROI num cols
sizeY = 70; %ROI num rows
rectX2 = rectX + 256;
%rectX3 = rectX2 + 384;
rectangle('Position',[rectX rectY sizeX sizeY])
rectangle('Position',[rectX2 rectY sizeX sizeY])
%rectangle('Position',[rectX3 rectY sizeX sizeY])
axis off;
%%
%must run the following:
%load('script7_21_pt8Values.mat');


%%

%{

THIS SECTION IS USED FOR THE PICTURES IN THE RESULTS SECTION

%}

%must be run after generateHeatMapConv
%       has done the regression

sliceNum=117;
rInds=60:130;cInds=1:80;
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
maxRadii=120;
averageTemps = zeros(1,maxRadii+1);
for curRadius = 0:maxRadii
    includeMat = single((rr-centR).^2 + (cc-centC).^2 <= curRadius^2);
    
    tempImageWithInc = tempImage.*includeMat;

    tempsInRegion = tempImageWithInc(:); 
    tempsInRegion = tempsInRegion(tempsInRegion>0);
    averageTemps(curRadius+1) = mean(tempsInRegion);
end
%%

averageTempsSliding = averageTemps;
averageTempsConv = averageTemps;

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







































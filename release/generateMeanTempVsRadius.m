%TO BE RUN AFTER GENERATEHEATMAP[METHOD].M
%   GENERATES GRAPH OF MEAN TEMPERATURE VERSUS RADIUS

%tempImage = thermMapROI;
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

%averageTempsPlot = {averageTemps};
%averageTempsPlot = {averageTemps averageTempsPlot};
%averageTempsPlot2 = {averageTempsPlot{1} plot2{1}};
%averageTempsPlot = {averageTempsPlot2{1} averageTempsPlot2{2} averageTemps};
NN = length(averageTempsPlot);
averageTempsPlotTemp = cell(1,NN+1);
for ind = 1:NN
    averageTempsPlotTemp{ind} = averageTempsPlot{ind};
end
averageTempsPlotTemp{NN+1}=averageTemps;
averageTempsPlot = averageTempsPlotTemp;
save('currentAvgTemps.mat','averageTempsPlot')

%%
figure
plot(0:maxRadii,averageTemps);
xlabel('Radius of Region centered at Ablation Zone (pixels)');
ylabel('Average Temperature in Region (Celcius)');

%%

xVals = (0:maxRadii).*0.9823; %mm for all patients, except 9
xVals2 = (0:maxRadii).*0.6549; %mm for pt 9

figure
plot(xVals2,averageTempsPlot{2},'r-');
hold on
%plot(xVals,averageTempsPlot{1},'b-');
plot(xVals,averageTempsPlot{3},'g-');
plot(xVals,averageTempsPlot{4},'b-');
plot(xVals,averageTempsPlot{5},'k-');
%plot(xVals,averageTempsPlot{6},'m-');
hold off
xlabel('Radius of Region centered at Ablation Zone (mm)');
ylabel('Average Temperature in Region (Celsius)');
legend('Patient 9',...
    'Patient 5, baseline scan: 5012',...
    'Patient 5, baseline scan: 5021',...
    'Patient 6');

%%


figure
plot(xVals2,averageTempsPlot{1},'r-');
hold on
plot(xVals,averageTempsPlot{3},'b-');
plot(xVals,averageTempsPlot{6},'g-');
hold off
xlabel('Radius of Region centered at Ablation Zone (mm)');
ylabel('Average Temperature in Region (Celcius)');
legend('Patient 9',...
    'Patient 5, baseline 1',...
    'Patient 3');

figure
plot(xVals2,averageTempsPlot{2},'r-');
hold on
plot(xVals,averageTempsPlot{4},'b-');
plot(xVals,averageTempsPlot{5},'g-');
hold off
xlabel('Radius of Region centered at Ablation Zone (mm)');
ylabel('Average Temperature in Region (Celcius)');
legend('Patient 4',...
    'Patient 5, baseline 3',...
    'Patient 6');
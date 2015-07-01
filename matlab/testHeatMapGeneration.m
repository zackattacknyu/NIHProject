%imgNum = 134;

imgNum = 104;
imgNumII = 107;
baselineFrame = fixedImg(:,:,imgNum);
%baselineFrame = baselineFrame(180:220,150:200);
comparisonFrame = movingImg3(:,:,imgNum);
comparisonFrame2 = movingImg4(:,:,imgNum);
%comparisonFrame = comparisonFrame(180:220,150:200);
baselineFrameII = fixedImg(:,:,imgNumII);
%baselineFrame = baselineFrame(180:220,150:200);
comparisonFrameII = movingImg3(:,:,imgNumII);
comparisonFrame2II = movingImg4(:,:,imgNumII);
sR=1;

%{
%center = [24 24];
%center = [174 202];
%center = [181 228];
center = [225 154];
comparisonFrameFilter = zeros(size(comparisonFrame));
for i = 1:size(comparisonFrame,1)
   for j=1:size(comparisonFrame,2)
       pt = [i j];
       dist = norm(pt-center);
       dist = max(1,dist);
       factor = 1 + (1/dist)*3;
       comparisonFrameFilter(i,j) = factor;
   end
end
comparisonFrameFF = comparisonFrame.*comparisonFrameFilter;
wronskianImage = wronskian(baselineFrame,comparisonFrameFF,sR,1);
%}

wronskianImage = wronskian(baselineFrame,comparisonFrame,sR,1);
wronskianImage2 = wronskian(baselineFrame,comparisonFrame2,sR,1);

wronskianImageII = wronskian(baselineFrameII,comparisonFrameII,sR,1);
wronskianImage2II = wronskian(baselineFrameII,comparisonFrame2II,sR,1);
%%
figure
imagesc(baselineFrame);
colorbar;

figure
imagesc(comparisonFrame);
colorbar;

figure
imagesc(comparisonFrame2);
colorbar;
%%
figure
imagesc(wronskianImage);
colorbar;

%%
maxVal = 15;
%figure
imtool3D(getModifiedWronskian(wronskianImage,maxVal));
%colorbar;

%figure
imtool3D(getModifiedWronskian(wronskianImage2,maxVal));
%colorbar;

%%
controlNeedleLoc = [225 154];
heatedNeedleLoc = [216 173];

%%

%Attempt Linear Regression
time1controlW = wronskianImage(224,153);
time1controlWII = wronskianImage(218,173);
time1controlTemp=42;

time2controlW = wronskianImage2(224,153);
time2controlWII = wronskianImage2(218,173);
time2controlTemp=37;

time1heatedW = wronskianImage(216,173);
time1heatedWII = wronskianImageII(213,168);
time1heatedTemp=145;

time2heatedW = wronskianImage2(216,173);
time2heatedWII = wronskianImage2II(213,168);
time2heatedTemp=47;

temps = [time1controlTemp time2controlTemp time1heatedTemp time2heatedTemp];
temps = [temps temps];
wVals = [time1controlW time2controlW time1heatedW time2heatedW];
wVals = [wVals time1controlWII time2controlWII time1heatedWII time2heatedWII];
%%
%coeff = polyfit(wVals,temps,1);
coeff = polyfit(wVals,temps,3);

xx = linspace(min(wVals),max(wVals));
yy = polyval(coeff,xx);
figure
plot(wVals,temps,'.');
hold on
plot(xx,yy);
hold off
%%

figure
wronskianMap = polyval(coeff,wronskianImage);
wronskianMapMM1 = wronskianMap;
wronskianMapMM1(wronskianMapMM1 > 150)=150;
imagesc(wronskianMapMM1);
colorbar;

figure
wronskianMap2 = polyval(coeff,wronskianImage2);
wronskianMapMM2 = wronskianMap2;
wronskianMapMM2(wronskianMapMM2 > 50)=50;
imagesc(wronskianMapMM2);
colorbar;

figure
wronskianMap = polyval(coeff,wronskianImageII);
wronskianMapMM1 = wronskianMap;
wronskianMapMM1(wronskianMapMM1 > 150)=150;
imagesc(wronskianMapMM1);
colorbar;

figure
wronskianMap2 = polyval(coeff,wronskianImage2II);
wronskianMapMM2 = wronskianMap2;
wronskianMapMM2(wronskianMapMM2 > 50)=50;
imagesc(wronskianMapMM2);
colorbar;

%%

wronskianBlock = polyval(coeff,wronskianArray3);
wronskianBlock2 = polyval(coeff,wronskianArray4);












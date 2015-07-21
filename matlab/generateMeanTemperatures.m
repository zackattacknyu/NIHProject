%TO BE RUN AFTER GENERATEHEATMAPSLIDINGWINDOW.M

%diffROIimage = diffFrameR2;
%diffROIimage = diffFrameR;

curRadius = 2; %radius for temperature zone in pixels

%inputImages = {diffFrameControl,diffFrameAblation,...
%    diffFrameControl2,diffFrameAblation2};
%inputImages = diffImages(1,1:2);
%inputImages = diffImages(:);
%inputImages = {diffFrameR};
inputImages = {diffFrameR diffFrameR2};

outputAvgTemps = cell(1,length(inputImages));


for ind = 1:length(inputImages)
    tempImage = polyval(coeff,inputImages{ind})+36;
    ff = figure;
    imagesc(tempImage);
    colorbar;
    [centerR, centerC] = ginput;
    avgTemps = zeros(1,length(centerR));
    for i = 1:length(centerR)
       avgTemps(i) =  getAverageTemp( tempImage,centerR(i),centerC(i),curRadius );
    end
    outputAvgTemps{ind} = avgTemps;
    close(ff);
end




%{
pt5,b1

comparison1,needle:64.1581
comparison1,thermocouple: 45.3853

comparison2,needle:65.9628
comparison2,thermocouple: 46.0497
%}

%%
%save('pt9_dataValues.mat');
%save('pt4_dataValues.mat');
%save('pt5b1_dataValues.mat');
%save('pt5b3_dataValues.mat');
%save('pt6b1_dataValues.mat');
save('pt3b1_dataValues.mat');
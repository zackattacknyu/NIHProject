%{
This can be run after the Thermal Map has been generated

It goes through the selected slices in the thermal map and finds 
    the average temperature in selected zones

Use this to find the average temps from regression for error analysis
%}

%MUST MANUALLY INPUT THE SLICE NUMBERS HERE
sliceNums = [10 68 86];


%radius for temperature zone in pixels
curRadius = 3; 

inputImages = currentThermalMap(:,:,sliceNums);
outputAvgTemps = cell(1,size(inputImages,3));


for ind = 1:size(inputImages,3)
    tempImage = inputImages(:,:,ind);
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

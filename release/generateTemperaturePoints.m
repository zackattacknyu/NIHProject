%{
TO BE RUN AFTER BASELINE AND COMPARISON FILE HAVE BEEN LOADED

This runs Needle Detection and picks the needle points as the ones
    to get the temperature values from. It generates a .mat file
    that can then be loaded via "Load Temperature Points" in the GUI
%}

%{
In tempPointTemps, specify the temperatures in the corresponding Needle
    tips. 

After needle detection is run, an array of size N by 2 is created where N
    is the number of needles detected. The first column is the needle
    tip closest to the center and the second column is the other needle
    tip. 
In each row of diffValsCellArrayCoords, specify the row and column of the
    needle tip found after needle detection. Most likely, this should be of
    the form:
    [1 1;
    2 1; 
    ...
    N 1]

    However, the second column should be 2 if you want it to select the
    other end point instead
%}
tempPointTemps = {18 11 14};
diffValsCellArrayCoords = ...
    [1 1;...
    2 1;...
    3 1];

[outputROI,minCoordsAll,maxCoordsAll,roiCenters] = ...
    getROIregions(baselineScan, HUthreshold,pointsThreshold,minNumNeedles,roiRadius );

outputImage = cell(size(outputROI));
diffValsGenerated = cell(size(outputROI));

tempPointDiffVals = cell(1,numel(tempPointTemps));
tempPointCoords = cell(1,numel(tempPointTemps));
tempPointNIIfiles = cell(1,numel(tempPointTemps));
tempPointStr = cell(1,numel(tempPointTemps));

for i = 1:numel(tempPointDiffVals)
    j = diffValsCellArrayCoords(i,1);
    k = diffValsCellArrayCoords(i,2);
   
    minCoords = minCoordsAll{j,k};
    maxCoords = maxCoordsAll{j,k};
    baselineROI = getBlockInVolume( baselineScan,minCoords,maxCoords );
    comparisonROI = getBlockInVolume( comparisonScan,minCoords,maxCoords );
    outputImageBlock = getSlidingWindowBlockJava(baselineROI,comparisonROI,fSize);
    generatedBlock = padarray(outputImageBlock,[fSize fSize 0]);

    center = roiCenters{j,k};

    [rowCoords,colCoords,sliceCoords]=meshgrid(...
        center(1)-wSize:1:center(1)+wSize,...
        center(2)-wSize:1:center(2)+wSize,...
        center(3)-wSize:1:center(3)+wSize);

    inds = sub2ind(size(baselineROI),...
        rowCoords(:),...
        colCoords(:),...
        sliceCoords(:));

    outputImage{j,k} = generatedBlock;
   
    tempPointDiffVals{i} = generatedBlock(inds);
    tempPointCoords{i} = roiCenters{j,k};
    
    niiFileName = strcat('results/roiSpatialOffset',num2str(j),'_',num2str(k),'_gen',makeDateTimeString(),'.nii');
    tempPointNIIfiles{i} = niiFileName;
    saveScanAsNII(outputImageBlock,niiFileName);
    tempPointStr{i} = strcat('Temperature_Point_',num2str(i));
    
end

nextTempPointNum = numel(tempPointTemps)+1;

outputFileName = strcat('results/tempPointInfo',makeDateTimeString(),'.mat');
save(outputFileName,'tempPointCoords','tempPointTemps',...
    'tempPointDiffVals','tempPointStr','tempPointNIIfiles',...
    'nextTempPointNum');








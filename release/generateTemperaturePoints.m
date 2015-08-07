%{
This is a shortcut script. 
TO BE RUN AFTER BASELINE AND COMPARISON FILE HAVE BEEN LOADED
%}

[outputROI,minCoordsAll,maxCoordsAll,roiCenters] = ...
    getROIregions(baselineScan, HUthreshold,pointsThreshold,minNumNeedles,roiRadius );

outputImage = cell(size(outputROI));
for j = 1:size(outputROI,1)
    for k = 1:2
        minCoords = minCoordsAll{j,k};
        maxCoords = maxCoordsAll{j,k};
        baselineROI = getBlockInVolume( baselineScan,minCoords,maxCoords );
        comparisonROI = getBlockInVolume( comparisonScan,minCoords,maxCoords );
        outputImage{j,k} = getSlidingWindowBlockJava(baselineROI,comparisonROI,fSize);
    end
end
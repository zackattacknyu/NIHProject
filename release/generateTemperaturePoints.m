%{
This is a shortcut script. 
TO BE RUN AFTER BASELINE AND COMPARISON FILE HAVE BEEN LOADED
%}

[outputROI,minCoordsAll,maxCoordsAll,roiCenters] = ...
    getROIregions(baselineScan, HUthreshold,pointsThreshold,minNumNeedles,roiRadius );

outputImage = cell(size(outputROI));
diffValsGenerated = cell(size(outputROI));
for j = 1:size(outputROI,1)
    for k = 1:2
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
        diffValsGenerated{j,k} = generatedBlock(inds);
    end
end
%%
tempVals = {44 1 5 10};
diffValsCellArrayCoords = [1 1;2 1;3 1;4 1];
diffValsCell = cell(1,numel(tempVals));
for i = 1:numel(diffValsCell)
   jj = diffValsCellArrayCoords(i,1);
   kk = diffValsCellArrayCoords(i,2);
   diffValsCell{i} = diffValsGenerated{jj,kk};
end








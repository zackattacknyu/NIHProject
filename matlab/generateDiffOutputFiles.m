function [ ] = generateDiffOutputFiles( ptNum,baselineScanNum,numCompare,huThreshold,pointsThreshold,minNumNeedles,roiRadius,fSize )
%GENERATEDIFFOUTPUTFILES Summary of this function goes here
%   Detailed explanation goes here

[fixedImg,~,movingImgRegArr] = ...
    initializeNIIfiles(ptNum,baselineScanNum,numCompare);
[outputROI,minCoordsAll,maxCoordsAll] = getROIregions( ...
    fixedImg, huThreshold,pointsThreshold,minNumNeedles,roiRadius );

movingOutputROI = cell([numCompare size(outputROI)]);
for img = 1:numCompare
    curBlock = movingImgRegArr{img};
   for j=1:size(outputROI,1)
      for k = 1:size(outputROI,2)
          minCoords = minCoordsAll{j,k};
          maxCoords = maxCoordsAll{j,k};
          movingOutputROI{img,j,k}=curBlock(minCoords(1):maxCoords(1),...
            minCoords(2):maxCoords(2),minCoords(3):maxCoords(3));
      end
   end
end


baseStr = num2str(baselineScanNum);
parentDir = strcat('niftiFilesPt',num2str(ptNum),'_',baseStr,'/');
diffOutputROI = cell([numCompare size(outputROI)]);
for j=1:size(outputROI,1)
  for k = 1:size(outputROI,2)
      curBaseROI = outputROI{j,k};
      for img = 1:numCompare
          curCompareROI = movingOutputROI{img,j,k};
          %curOutputDiff = zeros(size(curCompareROI));
          curOutputDiff = sqrt(getSlidingWindowBlocks(curBaseROI,curCompareROI,fSize));
          diffOutputROI{img,j,k}=curOutputDiff;
          
          niiDiffOutput = make_nii(curOutputDiff);
          niiFileName = strcat(parentDir,'DiffOutput_',...
              num2str(img),'_',num2str(j),'_',num2str(k),'.nii');
          save_nii(niiDiffOutput,niiFileName);
      end
  end
end
save(strcat(parentDir,'diffROIregionVars.mat'));

end


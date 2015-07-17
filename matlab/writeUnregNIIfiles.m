function [ outputDir,baselineNIIfilePath,comparisonNIIfilePaths ] ...
    = writeUnregNIIfiles( dataParentDir,mrns,ptNum,...
    baselineScanNum,numCompare )
%WRITEUNREGNIIFILES Summary of this function goes here
%   Detailed explanation goes here

ptFolder = getFolderPathWith(dataParentDir,mrns{ptNum});
ptSessionFolder = getFolderPathWith(ptFolder,'20');%should only be one folder here

baselineStr = num2str(baselineScanNum);
outputDir = strcat('niftiFilesPt',num2str(ptNum),'_',baselineStr,'/');
mkdir(outputDir);

baselineScansFolder = getFolderPathWith(ptSessionFolder,baselineStr);
[~,dcmFixed,~,fixedSlope,fixedInt] = getDCMFolderData(baselineScansFolder);
niiFixed = make_nii(dcmFixed);
baselineNIIfilePath = strcat(outputDir,'fixed_',baselineStr,'.nii');
save_nii(niiFixed,baselineNIIfilePath);

comparisonNIIfilePaths = cell(1,numCompare);
for ind = 1:numCompare
    comparison1ScanNum = num2str(baselineScanNum+ind);
    comparison1ScansFolder = getFolderPathWith(ptSessionFolder,comparison1ScanNum);
    [~,dcmMoving,~,movingSlope,movingInt] = getDCMFolderData(comparison1ScansFolder);
    niiMoving = make_nii(dcmMoving);
    comparison1NIIfilePath = strcat(outputDir,'moving_',comparison1ScanNum,'.nii');
    save_nii(niiMoving,comparison1NIIfilePath);
    comparisonNIIfilePaths{ind} = comparison1NIIfilePath;
end

save(strcat(outputDir,'dcmVars.mat'),'fixedSlope','fixedInt',...
    'movingSlope','movingInt');

end


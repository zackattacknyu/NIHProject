function [ outputDir,baselineNIIfilePath,comparison1NIIfilePath,comparison2NIIfilePath ] ...
    = writeUnregNIIfiles( dataParentDir,mrns,ptNum,...
    baselineScanNum,comparison1ScanNum,comparison2ScanNum )
%WRITEUNREGNIIFILES Summary of this function goes here
%   Detailed explanation goes here

ptFolder = getFolderPathWith(dataParentDir,mrns{ptNum});
ptSessionFolder = getFolderPathWith(ptFolder,'20');%should only be one folder here

baselineScansFolder = getFolderPathWith(ptSessionFolder,baselineScanNum);
comparison1ScansFolder = getFolderPathWith(ptSessionFolder,comparison1ScanNum);
comparison2ScansFolder = getFolderPathWith(ptSessionFolder,comparison2ScanNum);

outputDir = strcat('niftiFilesPt',num2str(ptNum),'_',baselineScanNum,'/');

[~,dcmFixed,~,fixedSlope,fixedInt] = getDCMFolderData(baselineScansFolder);
[~,dcmMoving,~,movingSlope,movingInt] = getDCMFolderData(comparison1ScansFolder);
[~,dcmMoving2,~,movingSlope2,movingInt2] = getDCMFolderData(comparison2ScansFolder);

niiFixed = make_nii(dcmFixed);
niiMoving = make_nii(dcmMoving);
niiMoving2 = make_nii(dcmMoving2);

mkdir(outputDir);
save(strcat(outputDir,'dcmVars.mat'),'fixedSlope','fixedInt',...
    'movingSlope','movingSlope2','movingInt','movingInt2');

baselineNIIfilePath = strcat(outputDir,'fixed_',baselineScanNum,'.nii');
comparison1NIIfilePath = strcat(outputDir,'moving_',comparison1ScanNum,'.nii');
comparison2NIIfilePath = strcat(outputDir,'moving_',comparison2ScanNum,'.nii');

save_nii(niiFixed,baselineNIIfilePath);
save_nii(niiMoving,comparison1NIIfilePath);
save_nii(niiMoving2,comparison2NIIfilePath);

end


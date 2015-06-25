%images 60-186 for ser_5005 have needle
%   that will work for ser_5006 and ser_5007

%folderNames = {'ser_5005','ser_5006'};
%folderNames = {'ser_5005','ser_5007'};
parentDir = 'timeSeries1_5005-5007/';
fixedFolderName = strcat(parentDir,'ser_5005/');
movingFolderName = strcat(parentDir,'ser_5007/');
thresholdFactor = 0.85;

dcmDataFixed = single(getDCMFolderDataThreshold(fixedFolderName,thresholdFactor));
dcmDataMoving = single(getDCMFolderDataThreshold(movingFolderName,thresholdFactor));

[optimizer, metric]  = imregconfig('monomodal');
[dcmDataRegistered,regInfo,regT] = ...
    imregister2(dcmDataMoving,dcmDataFixed,'affine',optimizer,metric,'DisplayOptimization',true); 

%%
%shows the newly registered images
imtool3D(dcmDataFixed+dcmDataRegistered);

%shows unregistered images
imtool3D(dcmDataFixed+dcmDataMoving);
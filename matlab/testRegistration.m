%images 60-186 for ser_5005 have needle
%   that will work for ser_5006 and ser_5007

%folderNames = {'ser_5005','ser_5006'};
%folderNames = {'ser_5005','ser_5007'};
parentDir = 'timeSeries1_5005-5007/';
fixedFolderName = strcat(parentDir,'ser_5005/');
movingFolderName = strcat(parentDir,'ser_5006/');
movingFolderName2 = strcat(parentDir,'ser_5007/');
thresholdFactor = 0.85;

dcmDataFixed = single(getDCMFolderDataThreshold(fixedFolderName,thresholdFactor));
dcmDataMoving = single(getDCMFolderDataThreshold(movingFolderName,thresholdFactor));
dcmDataMoving2 = single(getDCMFolderDataThreshold(movingFolderName2,thresholdFactor));

[optimizer, metric]  = imregconfig('monomodal');
[dcmDataRegistered,regInfo,regT] = ...
    imregister2(dcmDataMoving,dcmDataFixed,'affine',optimizer,metric,'DisplayOptimization',true); 
[dcmDataRegistered2,regInfo2,regT2] = ...
    imregister2(dcmDataMoving2,dcmDataFixed,'affine',optimizer,metric,'DisplayOptimization',true); 
%%
%shows the newly registered images
unregThreshold = figure('Name','Registered Slices Thresholded');
imtool3D(dcmDataFixed+dcmDataRegistered2,[0 0 1 1],unregThreshold);

%shows unregistered images
regThreshold = figure('Name','Unregistered Slices Thresholded');
imtool3D(dcmDataFixed+dcmDataMoving,[0 0 1 1],regThreshold);

%%
[~,dcmRawFixed] = getDCMFolderData(fixedFolderName);
[~,dcmRawMoving] = getDCMFolderData(movingFolderName);
[~,dcmRawMoving2] = getDCMFolderData(movingFolderName2);

dcmRawFixed = single(dcmRawFixed);
dcmRawMoving = single(dcmRawMoving);
dcmRawMoving2 = single(dcmRawMoving2);

Rfixed = imref3d(size(dcmRawFixed));
dcmRawMovingReg = imwarp(dcmRawMoving,regInfo,regT,'OutputView',Rfixed);
dcmRawMovingReg2 = imwarp(dcmRawMoving2,regInfo2,regT2,'OutputView',Rfixed);
%%

%raw data unregistered
unreg = figure('Name','Unregistered Slices');
imtool3D(dcmRawFixed+dcmRawMoving2,[0 0 1 1],unreg);

%raw data registered to the needles
regNeedles = figure('Name','Slices Registered to Needles');
imtool3D(dcmRawFixed+dcmRawMovingReg2,[0 0 1 1],regNeedles);
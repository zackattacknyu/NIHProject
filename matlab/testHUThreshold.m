%images 60-186 for ser_5005 have needle
%   that will work for ser_5006 and ser_5007

%folderNames = {'ser_5005','ser_5006'};
%folderNames = {'ser_5005','ser_5007'};
parentDir = 'timeSeries1_5005-5007/';
fixedFolderName = strcat(parentDir,'ser_5005/');
movingFolderName = strcat(parentDir,'ser_5006/');
movingFolderName2 = strcat(parentDir,'ser_5007/');
thresholdHU = 400;

dcmDataFixed = single(getDCMFolderDataHUThreshold(fixedFolderName,thresholdHU));
dcmDataMoving = single(getDCMFolderDataHUThreshold(movingFolderName,thresholdHU));
dcmDataMoving2 = single(getDCMFolderDataHUThreshold(movingFolderName2,thresholdHU));

[~,dcmRawFixed] = getDCMFolderData(fixedFolderName);
[~,dcmRawMoving] = getDCMFolderData(movingFolderName);
[~,dcmRawMoving2] = getDCMFolderData(movingFolderName2);
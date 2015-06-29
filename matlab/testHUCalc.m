%images 60-186 for ser_5005 have needle
%   that will work for ser_5006 and ser_5007

%folderNames = {'ser_5005','ser_5006'};
%folderNames = {'ser_5005','ser_5007'};
parentDir = 'timeSeries1_5005-5007/';
fixedFolderName = strcat(parentDir,'ser_5005/');
movingFolderName = strcat(parentDir,'ser_5006/');
movingFolderName2 = strcat(parentDir,'ser_5007/');
thresholdFactor = 0.85;

[~,~,dcmFixedHU] = getDCMFolderData(fixedFolderName);
[~,~,dcmMovingHU] = getDCMFolderData(movingFolderName);
[~,~,dcmMoving2HU] = getDCMFolderData(movingFolderName2);

%{
imtool3D(dcmFixedHU);
imtool3D(dcmMovingHU);
imtool3D(dcmMoving2HU);
%}
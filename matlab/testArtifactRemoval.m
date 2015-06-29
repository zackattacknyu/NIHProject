%images 60-186 for ser_5005 have needle
%   that will work for ser_5006 and ser_5007

%folderNames = {'ser_5005','ser_5006'};
%folderNames = {'ser_5005','ser_5007'};
parentDir = 'timeSeries1_5005-5007/';
fixedFolderName = strcat(parentDir,'ser_5005/');
movingFolderName = strcat(parentDir,'ser_5006/');
movingFolderName2 = strcat(parentDir,'ser_5007/');

[~,~,dcmFixedHU] = getDCMFolderData(fixedFolderName);
[~,~,dcmMovingHU] = getDCMFolderData(movingFolderName);
[~,~,dcmMoving2HU] = getDCMFolderData(movingFolderName2);

%%
dcmFixedHUBackProj = zeros(size(dcmFixedHU));
dcmMovingHUBackProj = zeros(size(dcmMovingHU));
dcmMoving2HUBackProj = zeros(size(dcmMoving2HU));
for i = 1:size(dcmFixedHU,3)
    i
    dcmFixedHUBackProj(:,:,i) = getFilteredBackprojectImg(dcmFixedHU(:,:,i));
    dcmMovingHUBackProj(:,:,i) = getFilteredBackprojectImg(dcmMovingHU(:,:,i));
    dcmMoving2HUBackProj(:,:,i) = getFilteredBackprojectImg(dcmMoving2HU(:,:,i));
end

%%
dcmFixedHUBackProjMod = dcmFixedHUBackProj;
dcmFixedHUBackProjMod(dcmFixedHUBackProjMod<0)=0;
dcmFixedHUBackProjMod(dcmFixedHUBackProjMod>400000)=40000;
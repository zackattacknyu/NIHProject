%writeDirName = 'Pt8ConvDiffVolumes/diffVol5002_5003/'; 
%infoDirName = 'timeSeriesPt8_5002-5004/ser_5002/';
writeDirName = 'Pt8ConvDiffVolumes/diffVol5002_5004/'; 
infoDirName = 'timeSeriesPt8_5002-5004/ser_5002/';
infoFilesInFolder = dir(infoDirName);
volToWrite = putin01scale(diffImageConv2);

for k = 1:size(volToWrite,3)
    readFileName = infoFilesInFolder(k+2,1).name;
    infoFilePath = strcat(infoDirName,readFileName);
    dcmMetadata = dicominfo(infoFilePath);
    fileName = strcat(writeDirName,'diffVol2Slice',num2str(k),'.dcm');
    dicomwrite(volToWrite(:,:,k),fileName,dcmMetadata);
end
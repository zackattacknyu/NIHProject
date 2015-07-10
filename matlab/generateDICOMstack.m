%writeDirName = 'Pt8ConvDiffVolumes/volume5002_5003/'; 
%volToWrite = putin01scale(diffImageConv);
%writeDirName = 'Pt8ConvDiffVolumes/volume5002_5004/'; 
%volToWrite = putin01scale(diffImageConv2);
writeDirName = 'Pt8ConvDiffVolumes/volume3/'; 
volToWrite2 = putin01scale(diffImageConv);
volToWrite3 = putin01scale(fixedImg);
volToWrite = putin01scale(volToWrite2+volToWrite3);

for k = 1:size(volToWrite,3)
    fileName = strcat(writeDirName,'diffVolSlice',num2str(k),'.dcm');
    dicomwrite(volToWrite(:,:,k),fileName);
end
writeDirName = 'Pt8ConvDiffVolumes/tiffVolume5002_5003/'; 

for k = 1:size(volToWrite,3)
    fileName = strcat(writeDirName,'5005Thresh_slice',num2str(k),'.png');
    imwrite(dcmArrayThreshold(:,:,k),fileName);
end
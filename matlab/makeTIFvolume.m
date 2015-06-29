filename = 'exampleThreshVolume.tif';

threshold = 400;
writeDirName = 'sampleTIFFvol/'; 
initIndex = 1;
endIndex = size(dcmFixedHU,3);

dcmArrayThreshold = dcmFixedHU>threshold;

for k = initIndex:endIndex
    fileName = strcat(writeDirName,'5005Thresh_slice',num2str(k),'.png');
    imwrite(dcmArrayThreshold(:,:,k),fileName);
end
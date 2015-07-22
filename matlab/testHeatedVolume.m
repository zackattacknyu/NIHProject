%TO BE RUN AFTER GENERATEHEATMAPSLIDINGWINDOW.M
%   OR AFTER LOADING SCRIPT_[DATE].mat VALUES
%
%MAKE SURE RINDS, CINDS, ZINDS ARE SET CORRECTLY
%

needleThreshold = 1000;
filePath = 'pt4_TempVolume/needleTempVol6.nii';

numTempValues = 2000;
needleValue = -1000;
baselineTemp=37;
minDisplayTemperature=50;
fSize=4;

rStart=rInds(1)+fSize;
rEnd=rInds(end)-fSize;
cStart=cInds(1)+fSize;
cEnd=cInds(end)-fSize;

tempBlock = polyval(coeff,sqrt(diffFrameBlock))+baselineTemp;

tempBlockWhole = zeros(size(fixedImg));

tempBlockWhole(rStart:rEnd,cStart:cEnd,zInds) = tempBlock;

temperatureIndices = find(tempBlockWhole>minDisplayTemperature);

tempBlockInsert = putin01scale(tempBlockWhole(temperatureIndices));
tempBlockInsert = tempBlockInsert.*numTempValues;

%needleIndices = find(fixedImg>needleThreshold);

volumeBlock = zeros(size(fixedImg));
volumeBlock(temperatureIndices)=tempBlockInsert;
%volumeBlock(needleIndices) = needleValue;

niiVolImage = make_nii(volumeBlock);
save_nii(niiVolImage,filePath);
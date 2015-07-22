%TO BE RUN AFTER GENERATEHEATMAPSLIDINGWINDOW.M
%   OR AFTER LOADING SCRIPT_[DATE].mat VALUES
%
%MAKE SURE RINDS, CINDS, ZINDS ARE SET CORRECTLY
%

needleThreshold = 2000;
filePath = 'pt4_TempVolume/needleTempVol2.nii';

numTempValues = 1000;
valueForMinTemp = 4000;
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
tempBlockInsert = tempBlockInsert.*numTempValues + valueForMinTemp;

needleIndices = find(fixedImg>needleThreshold);

fixedImgWithBlock = fixedImg;
fixedImgWithBlock(temperatureIndices)=tempBlockInsert;
fixedImgWithBlock(needleIndices) = fixedImg(needleIndices);

niiVolImage = make_nii(fixedImgWithBlock);
save_nii(niiVolImage,filePath);
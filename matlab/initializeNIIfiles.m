function [ fixedImg,movingImgArr,movingImgRegArr ] = initializeNIIfiles( ptNum,baselineScanNum,numCompare )
%INITIALIZENIIFILES Summary of this function goes here
%   Detailed explanation goes here

baseStr = num2str(baselineScanNum);
parentDir = strcat('niftiFilesPt',num2str(ptNum),'_',baseStr,'/');
load(strcat(parentDir,'dcmVars.mat'));

niiFixed = load_nii(strcat(parentDir,'fixed_',baseStr,'.nii'));
fixedImg = niiFixed.img;
fixedImg = fixedImg.*fixedSlope + fixedInt;

movingImgArr = cell(1,numCompare);
movingImgRegArr = cell(1,numCompare);
for i = 1:numCompare
   compareString = num2str(baselineScanNum+i); 
   niiMoving = load_nii(strcat(parentDir,'moving_',compareString,'.nii'));
   niiMovingReg = load_nii(strcat(parentDir,'moving_',compareString,'_registered.nii'));
   
   movingImg = niiMoving.img;
   movingImg = movingImg.*movingSlope + movingInt;
   movingImgArr{i} = movingImg;
   
   movingImgReg = niiMovingReg.img;
   movingImgReg = movingImgReg.*movingSlope + movingInt;
   movingImgRegArr{i} = movingImgReg;
end

end


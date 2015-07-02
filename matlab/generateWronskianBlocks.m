parentDir = 'niftiFiles/';

niiFixed = load_nii(strcat(parentDir,'fixed_5005.nii'));
niiMoving = load_nii(strcat(parentDir,'moving_5006.nii'));
niiMoving2 = load_nii(strcat(parentDir,'moving_5007.nii'));
niiMovingReg = load_nii(strcat(parentDir,'moving_5006_registered.nii'));
niiMovingReg2 = load_nii(strcat(parentDir,'moving_5007_registered.nii'));

fixedImg = niiFixed.img;
movingImg = niiMoving.img;
movingImg2 = niiMoving2.img;
movingImg3 = niiMovingReg.img;
movingImg4 = niiMovingReg2.img;
%%
%temporary. 
%   TO BE DELETED ONCE PROPER HU UNITS ARE IN NII FILES
fixedImg = fixedImg.*fixedSlope + fixedInt;
movingImg = movingImg.*movingSlope + movingInt;
movingImg2 = movingImg2.*movingSlope2 + movingInt2;
movingImg3 = movingImg3.*movingSlope + movingInt;
movingImg4 = movingImg4.*movingSlope2 + movingInt2;

%%
numSR=10;
kb = 2400;
kc = 4200;
movingImages = cell(1,4);
movingImages{1} = movingImg;
movingImages{2} = movingImg2;
movingImages{3} = movingImg3;
movingImages{4} = movingImg4;

%order is movingImageNum,blockType,sR
wronskianBlocks = cell(4,6,numSR);

for sR=1:numSR
    for iNum=1:4
        iNum
        sR
        datestr(now)
        
        wronskianBlocks{iNum,1,sR} = wronskian3D(fixedImg,movingImages{iNum},sR,1);
        wronskianBlocks{iNum,2,sR} = wronskian3D(fixedImg+kb,movingImages{iNum}+kb,sR,1);
        wronskianBlocks{iNum,3,sR} = wronskian3D(fixedImg+kc,movingImages{iNum}+kc,sR,1);

        wronskianBlocks{iNum,4,sR} = wronskian3D(movingImages{iNum},fixedImg,sR,1);
        wronskianBlocks{iNum,5,sR} = wronskian3D(movingImages{iNum}+kb,fixedImg+kb,sR,1);
        wronskianBlocks{iNum,6,sR} = wronskian3D(movingImages{iNum}+kc,fixedImg+kc,sR,1);
        
        datestr(now)
   end
end

%%
maxVal = 15;
wronskian1 = getModifiedWronskian(wronskianArray,maxVal);
wronskian2 = getModifiedWronskian(wronskianArray2,maxVal);
wronskian3 = getModifiedWronskian(wronskianArray3,maxVal);
wronskian4 = getModifiedWronskian(wronskianArray4,maxVal);

%%

h1 = figure('Name','5006, no registration');
imtool3D(wronskian1,[0 0 1 1],h1);
%h2 = figure('Name','5007, no registration');
%imtool3D(wronskian2,[0 0 1 1],h2);
h3 = figure('Name','5006, after NiftyReg');
imtool3D(wronskian3,[0 0 1 1],h3);
%h4 = figure('Name','5007, after NiftyReg');
%imtool3D(wronskian4,[0 0 1 1],h4);
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
sR=1;
kb = 2400;
kc = 4200;
wronskianBlock1 = wronskian3D(fixedImg,movingImg,sR,1);
wronskianBlock1b = wronskian3D(fixedImg+kb,movingImg+kb,sR,1);
wronskianBlock1c = wronskian3D(fixedImg+kc,movingImg+kc,sR,1);

wronskianBlock1d = wronskian3D(movingImg,fixedImg,sR,1);
wronskianBlock1e = wronskian3D(movingImg+kb,fixedImg+kb,sR,1);
wronskianBlock1f = wronskian3D(movingImg+kc,fixedImg+kc,sR,1);

wronskianBlock2 = wronskian3D(fixedImg,movingImg2,sR,1);
wronskianBlock2b = wronskian3D(fixedImg+kb,movingImg2+kb,sR,1);
wronskianBlock2c = wronskian3D(fixedImg+kc,movingImg2+kc,sR,1);

wronskianBlock2d = wronskian3D(movingImg2,fixedImg,sR,1);
wronskianBlock2e = wronskian3D(movingImg2+kb,fixedImg+kb,sR,1);
wronskianBlock2f = wronskian3D(movingImg2+kc,fixedImg+kc,sR,1);

wronskianBlock3 = wronskian3D(fixedImg,movingImg3,sR,1);
wronskianBlock3b = wronskian3D(fixedImg+kb,movingImg3+kb,sR,1);
wronskianBlock3c = wronskian3D(fixedImg+kc,movingImg3+kc,sR,1);

wronskianBlock3d = wronskian3D(movingImg3,fixedImg,sR,1);
wronskianBlock3e = wronskian3D(movingImg3+kb,fixedImg+kb,sR,1);
wronskianBlock3f = wronskian3D(movingImg3+kc,fixedImg+kc,sR,1);

wronskianBlock4 = wronskian3D(fixedImg,movingImg4,sR,1);
wronskianBlock4b = wronskian3D(fixedImg+kb,movingImg4+kb,sR,1);
wronskianBlock4c = wronskian3D(fixedImg+kc,movingImg4+kc,sR,1);

wronskianBlock4d = wronskian3D(movingImg4,fixedImg,sR,1);
wronskianBlock4e = wronskian3D(movingImg4+kb,fixedImg+kb,sR,1);
wronskianBlock4f = wronskian3D(movingImg4+kc,fixedImg+kc,sR,1);
%%
sR=2;
wronskianBlock5 = wronskian3D(fixedImg,movingImg,sR,1);
wronskianBlock6 = wronskian3D(fixedImg,movingImg2,sR,1);
wronskianBlock7 = wronskian3D(fixedImg,movingImg3,sR,1);
wronskianBlock8 = wronskian3D(fixedImg,movingImg4,sR,1);

sR=3;
wronskianBlock9 = wronskian3D(fixedImg,movingImg,sR,1);
wronskianBlock10 = wronskian3D(fixedImg,movingImg2,sR,1);
wronskianBlock11 = wronskian3D(fixedImg,movingImg3,sR,1);
wronskianBlock12 = wronskian3D(fixedImg,movingImg4,sR,1);

sR=4;
wronskianBlock13 = wronskian3D(fixedImg,movingImg,sR,1);
wronskianBlock14 = wronskian3D(fixedImg,movingImg2,sR,1);
wronskianBlock15 = wronskian3D(fixedImg,movingImg3,sR,1);
wronskianBlock16 = wronskian3D(fixedImg,movingImg4,sR,1);

sR=5;
wronskianBlock17 = wronskian3D(fixedImg,movingImg,sR,1);
wronskianBlock18 = wronskian3D(fixedImg,movingImg2,sR,1);
wronskianBlock19 = wronskian3D(fixedImg,movingImg3,sR,1);
wronskianBlock20 = wronskian3D(fixedImg,movingImg4,sR,1);

sR=6;
wronskianBlock21 = wronskian3D(fixedImg,movingImg,sR,1);
wronskianBlock22 = wronskian3D(fixedImg,movingImg2,sR,1);
wronskianBlock23 = wronskian3D(fixedImg,movingImg3,sR,1);
wronskianBlock24 = wronskian3D(fixedImg,movingImg4,sR,1);
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
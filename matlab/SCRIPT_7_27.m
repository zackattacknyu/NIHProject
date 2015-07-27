%gets data for Pt 9
clear all
SETUP
rInds=140:260;cInds=40:210;zInds=120:155;
call_7_27;
save('script7_27_pt9Values.mat');

%gets data for Pt 4
%   good ablation zone seems to be shown here
clear all
SETUP3
rInds=60:130;cInds=1:80;zInds=100:140;
call_7_27;
save('script7_27_pt4Values.mat');

%gets data for Pt 8
clear all
SETUP2
rInds = 60:190; cInds = 100:270; zInds = 200:230;
call_7_27;
save('script7_27_pt8Values.mat');

%gets data for Pt 5, baseline 1
clear all
SETUP6
rInds=1:78;cInds=40:142;zInds=70:100;
call_7_27;
save('script7_27_pt5b1Values.mat');

%gets data for Pt 5, baseline 3
clear all
SETUP7
rInds=1:120;cInds=40:176;zInds=90:110;
call_7_27;
save('script7_27_pt5b3Values.mat');


%{

The rest of this is the leftover 7-23 script

%}
clear all;
threshold = 2500; %HU for needle
pointsThreshold = 100; %number of points before connected component is considered important
roiRadius = 60;
fSize=4;

ptNum=3;
baselineScanNum=5007;
numCompare=1;
minNumNeedles=3;
call_7_23;

ptNum=3;
baselineScanNum=5011;
numCompare=1;
minNumNeedles=2;
call_7_23;

ptNum=5;
baselineScanNum=5019;
minNumNeedles=2;
numCompare=1;
call_7_23;

ptNum=5;
baselineScanNum=5024;
minNumNeedles=2;
numCompare=1;
call_7_23;

ptNum=9;
baselineScanNum=5010;
minNumNeedles=2;
numCompare=1;
call_7_23;

ptNum=13;
baselineScanNum=6;
minNumNeedles=2;
numCompare=2;
call_7_23;
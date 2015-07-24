threshold = 2500; %HU for needle
pointsThreshold = 100; %number of points before connected component is considered important
roiRadius = 60;
fSize=4;
%%
ptNum=11;
baselineScanNum=5007;
numCompare=4;
minNumNeedles=3;
call_7_23;
%%
ptNum=2;
baselineScanNum=5008;
numCompare=2;
minNumNeedles=5;
call_7_23;
%%
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




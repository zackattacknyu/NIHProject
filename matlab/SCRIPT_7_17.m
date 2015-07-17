mrns={
'7151512'
'2625817'
'7096033'
'7193178'
'7226044'
'7207839'
'7294980'
'4753161'
'7337085'
'7395413'
'7401449'
'7400548'
'7276941'};

dataParentDir = 'D:/Thermometry/';
initDir = 'D:/git/NIHProject/matlab/';

%gets data for Pt 2, baseline 1
[ fixedImg,movingImgArr,movingImgRegArr ] = initializeNIIfiles( 2,5008,2 );
fSize=4;
diffFrameBlocks = cell(1,length(movingImgRegArr));
for ind = 1:length(diffFrameBlocks)
    movingImgReg = movingImgRegArr{ind};
    diffFrameBlocks{ind} = getSlidingWindowBlocks(fixedImg,movingImgReg,fSize);
end
save('script7_17_pt2Values.mat');

%gets data for Pt 3, baseline 1
[ fixedImg,movingImgArr,movingImgRegArr ] = initializeNIIfiles( 3,5004,2 );
fSize=4;
diffFrameBlocks = cell(1,length(movingImgRegArr));
for ind = 1:length(diffFrameBlocks)
    movingImgReg = movingImgRegArr{ind};
    diffFrameBlocks{ind} = getSlidingWindowBlocks(fixedImg,movingImgReg,fSize);
end
save('script7_17_pt3Values.mat');

%gets data for Pt 6, baseline 1
[ fixedImg,movingImgArr,movingImgRegArr ] = initializeNIIfiles( 6,5009,2 );
fSize=4;
diffFrameBlocks = cell(1,length(movingImgRegArr));
for ind = 1:length(diffFrameBlocks)
    movingImgReg = movingImgRegArr{ind};
    diffFrameBlocks{ind} = getSlidingWindowBlocks(fixedImg,movingImgReg,fSize);
end
save('script7_17_pt6Values.mat');

%gets data for Pt 10, baseline 1
[ fixedImg,movingImgArr,movingImgRegArr ] = initializeNIIfiles( 10,5003,2 );
fSize=4;
diffFrameBlocks = cell(1,length(movingImgRegArr));
for ind = 1:length(diffFrameBlocks)
    movingImgReg = movingImgRegArr{ind};
    diffFrameBlocks{ind} = getSlidingWindowBlocks(fixedImg,movingImgReg,fSize);
end
save('script7_17_pt10Values.mat');

%run script for pt 11
system('runPt11scan5007')

%gets data for Pt 11
[ fixedImg,movingImgArr,movingImgRegArr ] = initializeNIIfiles( 11,5007,4 );
fSize=4;
diffFrameBlocks = cell(1,length(movingImgRegArr));
for ind = 1:length(diffFrameBlocks)
    movingImgReg = movingImgRegArr{ind};
    diffFrameBlocks{ind} = getSlidingWindowBlocks(fixedImg,movingImgReg,fSize);
end
save('script7_17_pt11Values.mat');

%set up more NII files
ptNum=2;
baselineScanNum = 5014;
numCompare = 2;
writeAllNIIfiles( initDir,dataParentDir,mrns,ptNum,...
    baselineScanNum,numCompare )
[ fixedImg,movingImgArr,movingImgRegArr ] = initializeNIIfiles( ptNum,baselineScanNum,numCompare );
fSize=4;
diffFrameBlocks = cell(1,length(movingImgRegArr));
for ind = 1:length(diffFrameBlocks)
    movingImgReg = movingImgRegArr{ind};
    diffFrameBlocks{ind} = getSlidingWindowBlocks(fixedImg,movingImgReg,fSize);
end
save('script7_17_pt2Values_2.mat');

%set up more NII files
ptNum=3;
baselineScanNum = 5007;
numCompare = 1;
writeAllNIIfiles( initDir,dataParentDir,mrns,ptNum,...
    baselineScanNum,numCompare )
[ fixedImg,movingImgArr,movingImgRegArr ] = initializeNIIfiles( ptNum,baselineScanNum,numCompare );
fSize=4;
diffFrameBlocks = cell(1,length(movingImgRegArr));
for ind = 1:length(diffFrameBlocks)
    movingImgReg = movingImgRegArr{ind};
    diffFrameBlocks{ind} = getSlidingWindowBlocks(fixedImg,movingImgReg,fSize);
end
save('script7_17_pt3Values_2.mat');

%set up more NII files
ptNum=3;
baselineScanNum = 5011;
numCompare = 1;
writeAllNIIfiles( initDir,dataParentDir,mrns,ptNum,...
    baselineScanNum,numCompare )
[ fixedImg,movingImgArr,movingImgRegArr ] = initializeNIIfiles( ptNum,baselineScanNum,numCompare );
fSize=4;
diffFrameBlocks = cell(1,length(movingImgRegArr));
for ind = 1:length(diffFrameBlocks)
    movingImgReg = movingImgRegArr{ind};
    diffFrameBlocks{ind} = getSlidingWindowBlocks(fixedImg,movingImgReg,fSize);
end
save('script7_17_pt3Values_3.mat');

%set up more NII files
ptNum=5;
baselineScanNum = 5019;
numCompare = 1;
writeAllNIIfiles( initDir,dataParentDir,mrns,ptNum,...
    baselineScanNum,numCompare )
[ fixedImg,movingImgArr,movingImgRegArr ] = initializeNIIfiles( ptNum,baselineScanNum,numCompare );
fSize=4;
diffFrameBlocks = cell(1,length(movingImgRegArr));
for ind = 1:length(diffFrameBlocks)
    movingImgReg = movingImgRegArr{ind};
    diffFrameBlocks{ind} = getSlidingWindowBlocks(fixedImg,movingImgReg,fSize);
end
save('script7_17_pt5Values_2.mat');

%set up more NII files
ptNum=5;
baselineScanNum = 5024;
numCompare = 1;
writeAllNIIfiles( initDir,dataParentDir,mrns,ptNum,...
    baselineScanNum,numCompare )
[ fixedImg,movingImgArr,movingImgRegArr ] = initializeNIIfiles( ptNum,baselineScanNum,numCompare );
fSize=4;
diffFrameBlocks = cell(1,length(movingImgRegArr));
for ind = 1:length(diffFrameBlocks)
    movingImgReg = movingImgRegArr{ind};
    diffFrameBlocks{ind} = getSlidingWindowBlocks(fixedImg,movingImgReg,fSize);
end
save('script7_17_pt5Values_4.mat');

%set up more NII files
ptNum=7;
baselineScanNum = 5002;
numCompare = 1;
writeAllNIIfiles( initDir,dataParentDir,mrns,ptNum,...
    baselineScanNum,numCompare )
[ fixedImg,movingImgArr,movingImgRegArr ] = initializeNIIfiles( ptNum,baselineScanNum,numCompare );
fSize=4;
diffFrameBlocks = cell(1,length(movingImgRegArr));
for ind = 1:length(diffFrameBlocks)
    movingImgReg = movingImgRegArr{ind};
    diffFrameBlocks{ind} = getSlidingWindowBlocks(fixedImg,movingImgReg,fSize);
end
save('script7_17_pt7Values_1.mat');

%set up more NII files
ptNum=7;
baselineScanNum = 5004;
numCompare = 1;
writeAllNIIfiles( initDir,dataParentDir,mrns,ptNum,...
    baselineScanNum,numCompare )
[ fixedImg,movingImgArr,movingImgRegArr ] = initializeNIIfiles( ptNum,baselineScanNum,numCompare );
fSize=4;
diffFrameBlocks = cell(1,length(movingImgRegArr));
for ind = 1:length(diffFrameBlocks)
    movingImgReg = movingImgRegArr{ind};
    diffFrameBlocks{ind} = getSlidingWindowBlocks(fixedImg,movingImgReg,fSize);
end
save('script7_17_pt7Values_2.mat');

%set up more NII files
ptNum=8;
baselineScanNum = 5005;
numCompare = 1;
writeAllNIIfiles( initDir,dataParentDir,mrns,ptNum,...
    baselineScanNum,numCompare )
[ fixedImg,movingImgArr,movingImgRegArr ] = initializeNIIfiles( ptNum,baselineScanNum,numCompare );
fSize=4;
diffFrameBlocks = cell(1,length(movingImgRegArr));
for ind = 1:length(diffFrameBlocks)
    movingImgReg = movingImgRegArr{ind};
    diffFrameBlocks{ind} = getSlidingWindowBlocks(fixedImg,movingImgReg,fSize);
end
save('script7_17_pt8Values_2.mat');

%set up more NII files
ptNum=9;
baselineScanNum = 5008;
numCompare = 1;
writeAllNIIfiles( initDir,dataParentDir,mrns,ptNum,...
    baselineScanNum,numCompare )
[ fixedImg,movingImgArr,movingImgRegArr ] = initializeNIIfiles( ptNum,baselineScanNum,numCompare );
fSize=4;
diffFrameBlocks = cell(1,length(movingImgRegArr));
for ind = 1:length(diffFrameBlocks)
    movingImgReg = movingImgRegArr{ind};
    diffFrameBlocks{ind} = getSlidingWindowBlocks(fixedImg,movingImgReg,fSize);
end
save('script7_17_pt9Values_2.mat');

%set up more NII files
ptNum=9;
baselineScanNum = 5010;
numCompare = 1;
writeAllNIIfiles( initDir,dataParentDir,mrns,ptNum,...
    baselineScanNum,numCompare )
[ fixedImg,movingImgArr,movingImgRegArr ] = initializeNIIfiles( ptNum,baselineScanNum,numCompare );
fSize=4;
diffFrameBlocks = cell(1,length(movingImgRegArr));
for ind = 1:length(diffFrameBlocks)
    movingImgReg = movingImgRegArr{ind};
    diffFrameBlocks{ind} = getSlidingWindowBlocks(fixedImg,movingImgReg,fSize);
end
save('script7_17_pt9Values_3.mat');

%set up more NII files
ptNum=12;
baselineScanNum = 5002;
numCompare = 1;
writeAllNIIfiles( initDir,dataParentDir,mrns,ptNum,...
    baselineScanNum,numCompare )
[ fixedImg,movingImgArr,movingImgRegArr ] = initializeNIIfiles( ptNum,baselineScanNum,numCompare );
fSize=4;
diffFrameBlocks = cell(1,length(movingImgRegArr));
for ind = 1:length(diffFrameBlocks)
    movingImgReg = movingImgRegArr{ind};
    diffFrameBlocks{ind} = getSlidingWindowBlocks(fixedImg,movingImgReg,fSize);
end
save('script7_17_pt12Values.mat');

%set up more NII files
ptNum=13;
baselineScanNum = 6;
numCompare = 2;
writeAllNIIfiles( initDir,dataParentDir,mrns,ptNum,...
    baselineScanNum,numCompare )
[ fixedImg,movingImgArr,movingImgRegArr ] = initializeNIIfiles( ptNum,baselineScanNum,numCompare );
fSize=4;
diffFrameBlocks = cell(1,length(movingImgRegArr));
for ind = 1:length(diffFrameBlocks)
    movingImgReg = movingImgRegArr{ind};
    diffFrameBlocks{ind} = getSlidingWindowBlocks(fixedImg,movingImgReg,fSize);
end
save('script7_17_pt13Values.mat');
%{
ptNum=2;
baselineScanNum=5014;
numCompare=2;
%}

%{
ptNum=3;
baselineScanNum=5004;
numCompare=2;
%}

ptNum=6;
baselineScanNum=5009;
numCompare=2;
[fixedImg,movingImgArr,movingImgRegArr] = ...
    initializeNIIfiles(ptNum,baselineScanNum,numCompare);


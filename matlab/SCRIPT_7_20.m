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

try

%set up more NII files
ptNum=2;
baselineScanNum = 5008;
numCompare = 2;
writeAllNIIfiles( initDir,dataParentDir,mrns,ptNum,...
    baselineScanNum,numCompare )

catch
    
end

try

%set up more NII files
ptNum=3;
baselineScanNum = 5007;
numCompare = 1;
writeAllNIIfiles( initDir,dataParentDir,mrns,ptNum,...
    baselineScanNum,numCompare )

catch
    
end

try
    
%set up more NII files
ptNum=3;
baselineScanNum = 5011;
numCompare = 1;
writeAllNIIfiles( initDir,dataParentDir,mrns,ptNum,...
    baselineScanNum,numCompare )


catch
    
end

try

%set up more NII files
ptNum=5;
baselineScanNum = 5019;
numCompare = 1;
writeAllNIIfiles( initDir,dataParentDir,mrns,ptNum,...
    baselineScanNum,numCompare )


catch
    
end

try

%set up more NII files
ptNum=5;
baselineScanNum = 5024;
numCompare = 1;
writeAllNIIfiles( initDir,dataParentDir,mrns,ptNum,...
    baselineScanNum,numCompare )


catch
    
end

try

%set up more NII files
ptNum=7;
baselineScanNum = 5002;
numCompare = 1;
writeAllNIIfiles( initDir,dataParentDir,mrns,ptNum,...
    baselineScanNum,numCompare )


catch
    
end

try

%set up more NII files
ptNum=7;
baselineScanNum = 5004;
numCompare = 1;
writeAllNIIfiles( initDir,dataParentDir,mrns,ptNum,...
    baselineScanNum,numCompare )


catch
    
end

try

%set up more NII files
ptNum=8;
baselineScanNum = 5005;
numCompare = 1;
writeAllNIIfiles( initDir,dataParentDir,mrns,ptNum,...
    baselineScanNum,numCompare )


catch
    
end

try

%set up more NII files
ptNum=9;
baselineScanNum = 5008;
numCompare = 1;
writeAllNIIfiles( initDir,dataParentDir,mrns,ptNum,...
    baselineScanNum,numCompare )

catch
    
end

try

%set up more NII files
ptNum=9;
baselineScanNum = 5010;
numCompare = 1;
writeAllNIIfiles( initDir,dataParentDir,mrns,ptNum,...
    baselineScanNum,numCompare )


catch
    
end

try

%set up more NII files
ptNum=12;
baselineScanNum = 5002;
numCompare = 1;
writeAllNIIfiles( initDir,dataParentDir,mrns,ptNum,...
    baselineScanNum,numCompare )

catch
    
end

try
    
%set up more NII files
ptNum=13;
baselineScanNum = 6;
numCompare = 2;
writeAllNIIfiles( initDir,dataParentDir,mrns,ptNum,...
    baselineScanNum,numCompare )

catch
    
end
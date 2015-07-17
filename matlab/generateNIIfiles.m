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

%ptNum=3;
%baselineScanNum = '5004';
%comparison1ScanNum = '5005';
%comparison2ScanNum = '5006';

%ptNum=6;
%baselineScanNum = '5009';
%comparison1ScanNum = '5010';
%comparison2ScanNum = '5011';
%%
ptNum=10;
baselineScanNum = '5003';
comparison1ScanNum = '5004';
comparison2ScanNum = '5005';

writeAllNIIfiles( initDir,dataParentDir,mrns,ptNum,...
    baselineScanNum,comparison1ScanNum,comparison2ScanNum )

ptNum=11;
baselineScanNum = '5007';
comparison1ScanNum = '5008';
comparison2ScanNum = '5009';

writeAllNIIfiles( initDir,dataParentDir,mrns,ptNum,...
    baselineScanNum,comparison1ScanNum,comparison2ScanNum )

ptNum=2;
baselineScanNum = '5014';
comparison1ScanNum = '5015';
comparison2ScanNum = '5016';

writeAllNIIfiles( initDir,dataParentDir,mrns,ptNum,...
    baselineScanNum,comparison1ScanNum,comparison2ScanNum )

%%

ptNum=11;
baselineScanNum = 5007;
numCompare = 4;
writeAllNIIfiles( initDir,dataParentDir,mrns,ptNum,...
    baselineScanNum,numCompare )
%{

[ outputDir,baselineNIIfilePath,comparison1NIIfilePath,comparison2NIIfilePath ] ...
    = writeUnregNIIfiles( dataParentDir,mrns,ptNum,...
    baselineScanNum,comparison1ScanNum,comparison2ScanNum );

[ commandName ] = writeNIIbatchScript( initDir,outputDir,ptNum,baselineScanNum,...
    comparison1ScanNum,comparison2ScanNum,baselineNIIfilePath,...
    comparison1NIIfilePath,comparison2NIIfilePath );

system(commandName)
%}

%reg_aladin -ref D:\git\NIHProject\matlab\niftiFilesPt5_b3\fixed_5021.nii -flo D:\git\NIHProject\matlab\niftiFilesPt5_b3\moving_5022.nii -aff D:\git\NIHProject\matlab\niftiFilesPt5_b3\moving_5022_transform.txt
%reg_aladin -ref D:\git\NIHProject\matlab\niftiFilesPt5_b3\fixed_5021.nii -flo D:\git\NIHProject\matlab\niftiFilesPt5_b3\moving_5023.nii -aff D:\git\NIHProject\matlab\niftiFilesPt5_b3\moving_5023_transform.txt
%reg_f3d -ref D:\git\NIHProject\matlab\niftiFilesPt5_b3\fixed_5021.nii -flo D:\git\NIHProject\matlab\niftiFilesPt5_b3\moving_5022.nii -aff D:\git\NIHProject\matlab\niftiFilesPt5_b3\moving_5022_transform.txt -cpp D:\git\NIHProject\matlab\niftiFilesPt5_b3\moving_5022_cpp.nii -res D:\git\NIHProject\matlab\niftiFilesPt5_b3\moving_5022_registered.nii
%reg_f3d -ref D:\git\NIHProject\matlab\niftiFilesPt5_b3\fixed_5021.nii -flo D:\git\NIHProject\matlab\niftiFilesPt5_b3\moving_5023.nii -aff D:\git\NIHProject\matlab\niftiFilesPt5_b3\moving_5023_transform.txt -cpp D:\git\NIHProject\matlab\niftiFilesPt5_b3\moving_5023_cpp.nii -res D:\git\NIHProject\matlab\niftiFilesPt5_b3\moving_5023_registered.nii



























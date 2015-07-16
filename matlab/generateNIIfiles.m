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
%%

ptNum=3;
dataParentDir = 'D:/Thermometry/';

baselineScanNum = '5004';
comparison1ScanNum = '5005';
comparison2ScanNum = '5006';
%%
ptFolder = getFolderPathWith(dataParentDir,mrns{ptNum});
ptSessionFolder = getFolderPathWith(ptFolder,'20');%should only be one folder here

baselineScansFolder = getFolderPathWith(ptSessionFolder,baselineScanNum);
comparison1ScansFolder = getFolderPathWith(ptSessionFolder,comparison1ScanNum);
comparison2ScansFolder = getFolderPathWith(ptSessionFolder,comparison2ScanNum);

outputDir = strcat('niftiFilesPt',num2str(ptNum),'_',baselineScanNum,'/');

[~,dcmFixed,~,fixedSlope,fixedInt] = getDCMFolderData(baselineScansFolder);
[~,dcmMoving,~,movingSlope,movingInt] = getDCMFolderData(comparison1ScansFolder);
[~,dcmMoving2,~,movingSlope2,movingInt2] = getDCMFolderData(comparison2ScansFolder);

niiFixed = make_nii(dcmFixed);
niiMoving = make_nii(dcmMoving);
niiMoving2 = make_nii(dcmMoving2);

mkdir(outputDir);
save(strcat(outputDir,'dcmVars.mat'),'fixedSlope','fixedInt',...
    'movingSlope','movingSlope2','movingInt','movingInt2');

baselineNIIfilePath = strcat(outputDir,'fixed_',baselineScanNum,'.nii');
comparison1NIIfilePath = strcat(outputDir,'moving_',comparison1ScanNum,'.nii');
comparison2NIIfilePath = strcat(outputDir,'moving_',comparison2ScanNum,'.nii');

save_nii(niiFixed,baselineNIIfilePath);
save_nii(niiMoving,comparison1NIIfilePath);
save_nii(niiMoving2,comparison2NIIfilePath);

%%

initDir = 'D:/git/NIHProject/matlab/';
baselineNIIfile = strcat(initDir,baselineNIIfilePath);
comparison1NIIfile = strcat(initDir,comparison1NIIfilePath);
comparison2NIIfile = strcat(initDir,comparison2NIIfilePath);

comparison1transformPath = strcat(initDir,outputDir,'moving_',comparison1ScanNum,'_transform.txt');
comparison2transformPath = strcat(initDir,outputDir,'moving_',comparison2ScanNum,'_transform.txt');

comparison1cppPath = strcat(initDir,outputDir,'moving_',comparison1ScanNum,'_cpp.nii');
comparison2cppPath = strcat(initDir,outputDir,'moving_',comparison2ScanNum,'_cpp.nii');

comparison1resPath = strcat(initDir,outputDir,'moving_',comparison1ScanNum,'_registered.nii');
comparison2resPath = strcat(initDir,outputDir,'moving_',comparison2ScanNum,'_registered.nii');

line1 = {'reg_aladin -ref',baselineNIIfile,'-flo',comparison1NIIfile,...
    ' -aff ',comparison1transformPath};
line2 = {'reg_aladin -ref',baselineNIIfile,'-flo',comparison2NIIfile,...
    ' -aff ',comparison2transformPath};

line3 = {'reg_f3d -ref',baselineNIIfile,'-flo',comparison1NIIfile,...
    '-aff',comparison1transformPath,'-cpp',comparison1cppPath,'-res',comparison1resPath};
line4 = {'reg_f3d -ref',baselineNIIfile,'-flo',comparison2NIIfile,...
    '-aff',comparison2transformPath,'-cpp',comparison2cppPath,'-res',comparison2resPath};

line1txt = strjoin(line1);
line2txt = strjoin(line2);
line3txt = strjoin(line3);
line4txt = strjoin(line4);
%%
commandName = strcat('runPt',num2str(ptNum),'scan',baselineScanNum);
%%
batchFileName = strcat(commandName,'.bat');
fid = fopen(batchFileName,'w');
fprintf(fid,'%s\n',line1txt);
fprintf(fid,'%s\n',line2txt);
fprintf(fid,'%s\n',line3txt);
fprintf(fid,'%s\n',line4txt);
fclose(fid);
%%
system(commandName)


%reg_aladin -ref D:\git\NIHProject\matlab\niftiFilesPt5_b3\fixed_5021.nii -flo D:\git\NIHProject\matlab\niftiFilesPt5_b3\moving_5022.nii -aff D:\git\NIHProject\matlab\niftiFilesPt5_b3\moving_5022_transform.txt
%reg_aladin -ref D:\git\NIHProject\matlab\niftiFilesPt5_b3\fixed_5021.nii -flo D:\git\NIHProject\matlab\niftiFilesPt5_b3\moving_5023.nii -aff D:\git\NIHProject\matlab\niftiFilesPt5_b3\moving_5023_transform.txt
%reg_f3d -ref D:\git\NIHProject\matlab\niftiFilesPt5_b3\fixed_5021.nii -flo D:\git\NIHProject\matlab\niftiFilesPt5_b3\moving_5022.nii -aff D:\git\NIHProject\matlab\niftiFilesPt5_b3\moving_5022_transform.txt -cpp D:\git\NIHProject\matlab\niftiFilesPt5_b3\moving_5022_cpp.nii -res D:\git\NIHProject\matlab\niftiFilesPt5_b3\moving_5022_registered.nii
%reg_f3d -ref D:\git\NIHProject\matlab\niftiFilesPt5_b3\fixed_5021.nii -flo D:\git\NIHProject\matlab\niftiFilesPt5_b3\moving_5023.nii -aff D:\git\NIHProject\matlab\niftiFilesPt5_b3\moving_5023_transform.txt -cpp D:\git\NIHProject\matlab\niftiFilesPt5_b3\moving_5023_cpp.nii -res D:\git\NIHProject\matlab\niftiFilesPt5_b3\moving_5023_registered.nii



























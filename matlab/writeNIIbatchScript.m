function [ commandName ] = writeNIIbatchScript( initDir,outputDir,ptNum,baselineScanNum,comparison1ScanNum,...
    comparison2ScanNum,baselineNIIfilePath,comparison1NIIfilePath,comparison2NIIfilePath )
%WRITENIIBATCHSCRIPT Summary of this function goes here
%   Detailed explanation goes here

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

commandName = strcat('runPt',num2str(ptNum),'scan',baselineScanNum);

batchFileName = strcat(commandName,'.bat');
fid = fopen(batchFileName,'w');
fprintf(fid,'%s\n',line1txt);
fprintf(fid,'%s\n',line2txt);
fprintf(fid,'%s\n',line3txt);
fprintf(fid,'%s\n',line4txt);
fclose(fid);

end


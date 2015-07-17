function [ commandName ] = writeNIIbatchScript( initDir,outputDir,ptNum,baselineScanNum,...
    baselineNIIfilePath,comparisonNIIfilePaths )
%WRITENIIBATCHSCRIPT Summary of this function goes here
%   Detailed explanation goes here

commandName = strcat('runPt',num2str(ptNum),'scan',num2str(baselineScanNum));
baselineNIIfile = strcat(initDir,baselineNIIfilePath);
batchFileName = strcat(commandName,'.bat');
fid = fopen(batchFileName,'w');

for ind = 1:length(comparisonNIIfilePaths)
    
    comparison1ScanNum = num2str(baselineScanNum+ind);
    
    comparison1NIIfile = strcat(initDir,comparisonNIIfilePaths{ind});
    comparison1transformPath = strcat(initDir,outputDir,'moving_',comparison1ScanNum,'_transform.txt');
    comparison1cppPath = strcat(initDir,outputDir,'moving_',comparison1ScanNum,'_cpp.nii');
    comparison1resPath = strcat(initDir,outputDir,'moving_',comparison1ScanNum,'_registered.nii');

    line1 = {'reg_aladin -ref',baselineNIIfile,'-flo',comparison1NIIfile,...
        ' -aff ',comparison1transformPath};

    line3 = {'reg_f3d -ref',baselineNIIfile,'-flo',comparison1NIIfile,...
        '-aff',comparison1transformPath,'-cpp',comparison1cppPath,'-res',comparison1resPath};

    line1txt = strjoin(line1);
    line3txt = strjoin(line3);
    
    fprintf(fid,'%s\n',line1txt);
    fprintf(fid,'%s\n',line3txt);
    
end

fclose(fid);

end


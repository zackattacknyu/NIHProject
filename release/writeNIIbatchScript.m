function [ commandName, batchFilePath ] = writeNIIbatchScript( baselineNIIfilePath,comparisonNIIfilePath )
%WRITENIIBATCHSCRIPT Summary of this function goes here
%   Detailed explanation goes here
writeDirectory = strcat(pwd,'\temp');
if(~exist(writeDirectory,'dir'))
    mkdir(writeDirectory);
end

entries = datevec(now);
outputStr = 'batchScript';
for i = 1:length(entries)
    outputStr = strcat(outputStr,'_',int2str(entries(i)));
end
commandName = strcat('temp\',outputStr);
batchFilePath = strcat(pwd,'\',commandName,'.bat');
fid = fopen(batchFilePath,'w');

[comparisonFilePath,comparisonFileName,~] = fileparts(comparisonNIIfilePath);

initComparisonPath = strcat(comparisonFilePath,'\',comparisonFileName);
comparisontransformPath = strcat(initComparisonPath,'_transform.txt');
comparisoncppPath = strcat(initComparisonPath,'_cpp.nii');
comparisonresPath = strcat(initComparisonPath,'_registered.nii');

line1 = {'reg_aladin -ref',' ',baselineNIIfilePath,' ','-flo',' ',...
    comparisonNIIfilePath,' ',...
    ' -aff ',' ',comparisontransformPath};

line3 = {'reg_f3d -ref',' ',baselineNIIfilePath,' ','-flo',' ',comparisonNIIfilePath,' ',...
    '-aff',' ',comparisontransformPath,' ','-cpp',' ',comparisoncppPath...
    ,' ','-res',' ',comparisonresPath};

line1txt = [line1{:}];
line3txt = [line3{:}];

fprintf(fid,'%s\n',line1txt);
fprintf(fid,'%s\n',line3txt);

fclose(fid);

end


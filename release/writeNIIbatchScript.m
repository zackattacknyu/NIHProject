function [ commandName, batchFilePath ] = writeNIIbatchScript( baselineNIIfilePath,comparisonNIIfilePath )
%WRITENIIBATCHSCRIPT generates the registration batch script
%
%   INPUT:
%       baselineNIIfilePath - file path for baseline NII file
%       comparisonNIIfilePath - file path for comparison NII file
%
%   OUTPUT
%       commandName - MS DOS command to start batch script
%       batchFilePath - path of .bat file generated
writeDirectory = strcat(pwd,'\temp');
if(~exist(writeDirectory,'dir'))
    mkdir(writeDirectory);
end

outputStr = 'batchScript';
outputStr = strcat(outputStr,makeDateTimeString());
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


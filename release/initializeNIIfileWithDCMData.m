function [ fixedImg ] = initializeNIIfileWithDCMData( parentDir,niiFileName )
%INITIALIZENIIFILES 
%   This takes in a NII file and returns a 3D array of the HU unit data
%
%   This assumes two possibilities:
%       1. NII file has HU unit data
%       2. NII file is raw DICOM data and that the folder
%       with the NII file contains a file called dcmVars.mat which
%       contain the rescale slope and intercept

fixedImg = initializeNIIfile(parentDir,niiFileName);
dcmFileFullPath = strcat(parentDir,'dcmVars.mat');
if(logical(exist(dcmFileFullPath,'file')))
    load(dcmFileFullPath);
    fixedImg = fixedImg.*fixedSlope + fixedInt;
end

end


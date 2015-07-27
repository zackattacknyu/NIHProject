function [ fixedImg ] = initializeNIIfileWithDCMData( parentDir,niiFileName )
%INITIALIZENIIFILES 
%   This takes in a NII file and returns a 3D array of the HU unit data
%
%   This assumes the NII file is raw DICOM data and that the folder
%       with the NII file contains a file called dcmVars.mat which
%       contain the rescale slope and intercept

fixedImg = initializeNIIfile(parentDir,niiFileName);
load(strcat(parentDir,'dcmVars.mat'));
fixedImg = fixedImg.*fixedSlope + fixedInt;

end


function [ fixedImg ] = initializeNIIfile( parentDir,niiFileName )
%INITIALIZENIIFILES 
%   This takes in an NII file and returns a 3D array of its
%       raw data.

niiFilePath = strcat(parentDir,'/',niiFileName);
niiFixed = load_nii(niiFilePath);
fixedImg = niiFixed.img;

end


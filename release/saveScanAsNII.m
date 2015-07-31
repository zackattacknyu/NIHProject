function [ ] = saveScanAsNII( scanData,outputFilePath )
%SAVESCANASNII Summary of this function goes here
%   Detailed explanation goes here
niiFixed = make_nii(scanData);
save_nii(niiFixed,outputFilePath);

end


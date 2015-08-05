function [ ] = saveScanAsNII( scanData,outputFilePath )
%SAVESCANASNII takes in 3D volume and file path and makes the NII file

niiFixed = make_nii(scanData);
save_nii(niiFixed,outputFilePath);

end


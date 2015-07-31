function [dcmFixedHU]= writeNIIfile( inputScansFolder,outputFilePath )
%WRITENIIFILE takes in DICOM folder and saves NII file with HU unit data
%
%   This takes in an folder with DICOM files and does the following:
%       - Reads the slope and intercept
%       - Reads the raw data
%       - Outputs the NII file with the HU unit data for the DICOM folder

dcmFixedHU = getDCMFolderData(inputScansFolder);
saveScanAsNII(dcmFixedHU,outputFilePath);


end


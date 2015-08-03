function [ dcmFixedHU,outputFilePath ] = saveDICOMfolder( inputFolder )
%SAVEDICOMFOLDER Summary of this function goes here
%   Detailed explanation goes here

if( inputFolder(end)~='\' )
   inputFolder = strcat(inputFolder,'\'); 
end
[dcmFixedHU,FamilyName,StudyDate,SeriesNumber] = getDCMFolderData(inputFolder);

outputFilePath = strcat('results/',FamilyName,'_',StudyDate,'_',...
    num2str(SeriesNumber),'.nii');
saveScanAsNII(dcmFixedHU,outputFilePath);

end


function [ dcmFixedHU,outputFilePath ] = saveDICOMfolder( inputFolder )
%SAVEDICOMFOLDER Takes in DICOM folder and outputs specific NII file
%
%The NII file it outputs is as follows:
%   results/<FamilyName>_<StudyDate>_<SeriesNumber>.nii

if( inputFolder(end)~='\' )
   inputFolder = strcat(inputFolder,'\'); 
end
[dcmFixedHU,FamilyName,StudyDate,SeriesNumber] = getDCMFolderData(inputFolder);

outputFilePath = strcat(pwd,'\results\',FamilyName,'_',StudyDate,'_',...
    num2str(SeriesNumber),'.nii');
if(exist(outputFilePath,'file'))
    msgbox('Study Data Already Imported');
else
    saveScanAsNII(dcmFixedHU,outputFilePath);
end

end


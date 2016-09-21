function [ dcmArrayHU,FamilyName,StudyDate,SeriesNumber ] = getDCMFolderData( dirName )
%GETDCMFOLDERDATA gets DICOM data from folder
%
%   INPUT:
%       dirName - directory containing the .dcm files
%
%   OUTPUT
%       dcmArrayHU - The volume for the entire scan in the folder
%       FamilyName - The last name of the patient as specified in .dcm
%                   files
%       StudyDate - study date as specified in .dcm files
%       SeriesNumber - series number as specified in .dcm files

filesInFolder = dir(dirName);
numFiles = size(filesInFolder,1);
dcmData = cell(1,numFiles);
suffix = '.dcm';
n = 4;
index = 1;
slope = 1;
intercept = 0;
for i = 1:numFiles
    filename = filesInFolder(i,1).name;
    filepath = strcat(dirName,filename);
    if(length(filename) < 4)
       continue; %do not include it 
    end
    if(strcmp(filename(end-n+1:end), suffix))
       dcmData{index} = dicomread(filepath); 
       dcmInfo = dicominfo(filepath);
       if(isfield(dcmInfo,'RescaleIntercept'))
           slope=dcmInfo.RescaleSlope;
           intercept=dcmInfo.RescaleIntercept;
           FamilyName = dcmInfo.PatientName.FamilyName;
           StudyDate = dcmInfo.StudyDate;
           SeriesNumber = dcmInfo.SeriesNumber;
       end
       index = index + 1;
    end
end
dcmData = dcmData(1:(index-1));

dcmArray = zeros([size(dcmData{1}) length(dcmData)]);
for k = 1:length(dcmData)
   dcmArray(:,:,k) = dcmData{k};
end

%does the Hounsfeld Unit conversion
dcmArrayHU = (dcmArray.*slope) + intercept;

end


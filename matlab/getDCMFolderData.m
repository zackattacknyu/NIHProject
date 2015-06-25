function [ dcmData,dcmArray ] = getDCMFolderData( dirName )
%GETDCMFOLDERDATA Summary of this function goes here
%   dcmData - puts the matrices into a cell
%   dcmAray - makes a large array

filesInFolder = dir(dirName);
numFiles = size(filesInFolder,1);
dcmData = cell(1,numFiles);
suffix = '.dcm';
n = 4;
index = 1;
for i = 1:numFiles
    filename = filesInFolder(i,1).name;
    filepath = strcat(dirName,filename);
    if(length(filename) < 4)
       continue; %do not include it 
    end
    if(strcmp(filename(end-n+1:end), suffix))
       dcmData{index} = dicomread(filepath); 
       index = index + 1;
    end
end
dcmData = dcmData(1:(index-1));

dcmArray = zeros([size(dcmData{1}) length(dcmData)]);
for k = 1:length(dcmData)
   dcmArray(:,:,k) = dcmData{k};
end

end


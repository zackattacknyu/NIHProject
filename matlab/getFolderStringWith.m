function [ folderName ] = getFolderStringWith( directory,stringToFind )
%GETFOLDERSTRINGWITH Summary of this function goes here
%   Detailed explanation goes here

fileList = dir(directory);
for ii = 1:length(fileList)
    if(fileList(ii).isdir && ...
            ~isempty(strfind(fileList(ii).name,stringToFind)))
       folderName = fileList(ii).name;
       break;
    end
end

end


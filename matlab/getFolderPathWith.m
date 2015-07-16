function [ folderPath ] = getFolderPathWith( directory,stringToFind )
%GETFOLDERSTRINGWITH Summary of this function goes here
%   Detailed explanation goes here

ptFolder = getFolderStringWith(directory,stringToFind);
folderPath = strcat(directory,ptFolder,'/');

end


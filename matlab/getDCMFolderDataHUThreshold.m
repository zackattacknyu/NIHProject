function [ dcmArrayThreshold ] = getDCMFolderDataHUThreshold( dirName,thresholdHU )
%GETDCMFOLDERDATATHRESHOLD Summary of this function goes here
%   Detailed explanation goes here

[~,~,dcmArrayHU] = getDCMFolderData(dirName);
dcmArrayThreshold = dcmArrayHU>thresholdHU;
end


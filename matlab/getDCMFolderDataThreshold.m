function [ dcmArrayThreshold ] = getDCMFolderDataThreshold( dirName,thresholdFactor )
%GETDCMFOLDERDATATHRESHOLD Summary of this function goes here
%   Detailed explanation goes here

[~,dcmArray] = getDCMFolderData(dirName);
maxPixel = max(max(max(dcmArray)));
threshold = maxPixel*thresholdFactor;
dcmArrayThreshold = dcmArray>threshold;
end


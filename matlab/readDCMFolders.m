%images 60-186 for ser_5005 have needle
%   that will work for ser_5006 and ser_5007

%dirName = 'timeSeries1_5005-5007_slices50-249/ser_5005/';
%dirName = 'timeSeries1_5005-5007/ser_5005/';
dirName = 'timeSeries1_5005-5007/ser_5007/';
thresholdFactor = 0.85;

[dcmData,dcmArray] = getDCMFolderData(dirName);

maxPixel = max(max(max(dcmArray)));
threshold = maxPixel*thresholdFactor;
dcmArrayThreshold = dcmArray>threshold;
imtool3D(dcmArrayThreshold);
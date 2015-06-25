%images 60-186 for ser_5005 have needle
%   that will work for ser_5006 and ser_5007

%folderNames = {'ser_5005','ser_5006'};
folderNames = {'ser_5005','ser_5007'};
thresholdFactor = 0.85;
%writeDirName = 'timeSeries1_5005-5007_slices60-186_needleImages/stack5005_5006/'; 
writeDirName = 'timeSeries1_5005-5007_slices60-186_needleImages/stack5005_5007/'; 
initIndex = 60;
endIndex = 186;

for t=1:2
    timeSeriesName = strcat(folderNames(t),'/');
    dirName = strcat('timeSeries1_5005-5007/',timeSeriesName{1});
    
    [dcmData,dcmArray] = getDCMFolderData(dirName);
    maxPixel = max(max(max(dcmArray)));
    threshold = maxPixel*thresholdFactor;
    dcmArrayThreshold = dcmArray>threshold;
    %imtool3D(dcmArrayThreshold);

    for k = initIndex:endIndex
        fileName = strcat(writeDirName,folderNames(t),'_slice',num2str(k),'.dcm');
        dicomwrite(dcmArrayThreshold(:,:,k),fileName{1});
    end
end

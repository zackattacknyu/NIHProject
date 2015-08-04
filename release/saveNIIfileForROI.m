function [  ] = saveNIIfileForROI( currentROI,curROIString )
%SAVENIIFILEFORROI Summary of this function goes here
%   Detailed explanation goes here


outputStr = 'results/ROIselectedOn';
outputStr = strcat(outputStr,makeDateTimeString());

outputStr = strcat(outputStr,'-',curROIString,'.nii');
saveScanAsNII(currentROI,outputStr);

end


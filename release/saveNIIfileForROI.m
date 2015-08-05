function [  ] = saveNIIfileForROI( currentROI,curROIString )
%SAVENIIFILEFORROI saves the NII file for a selected ROI


outputStr = 'results/ROIselectedOn';
outputStr = strcat(outputStr,makeDateTimeString());

outputStr = strcat(outputStr,'-',curROIString,'.nii');
saveScanAsNII(currentROI,outputStr);

end


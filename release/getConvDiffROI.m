function [ diffROIConv ] = getConvDiffROI( baseROI,comparisonROI,fSize )
%GETCONVDIFFROI Summary of this function goes here
%   Detailed explanation goes here

fixedImgConv = getAverageFilteredBlocks(baseROI,fSize);
movingImgConv = getAverageFilteredBlocks(comparisonROI,fSize);

diffROIConv=fixedImgConv-movingImgConv;

end


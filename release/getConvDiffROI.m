function [ diffROIConv ] = getConvDiffROI( baseROI,comparisonROI,fSize )
%GETCONVDIFFROI Obtains convolutional difference block
%
%   INPUT:
%       baseROI - input baseline volume
%       comparisonROI - input comparison volume
%       fSize - filter size
%
%   OUTPUT
%       diffROIConv - the volume where each voxel is the difference between 
%                   the filtered base and comparison volume voxels

fixedImgConv = getAverageFilteredBlocks(baseROI,fSize);
movingImgConv = getAverageFilteredBlocks(comparisonROI,fSize);

diffROIConv=fixedImgConv-movingImgConv;

end


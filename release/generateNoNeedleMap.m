function [ thermalMapNoNeedle ] = generateNoNeedleMap( currentBaseROI,currentThermalMap,fSize,HUthreshold )
%GENERATENONEEDLEMAP takes in 3D volume. makes voxels zero that contain needle
%   INPUT:
%       currentBaseROI - baseline scan ROI volume. 
%                         used to find voxels which contain needle
%       currentThermalMap - input 3D volume. will remain intact, except
%                           that needle voxels will equal zero
%       fSize - half-width of window used when generating thermal map
%       HUthreshold - if a voxel is above this HU value, it is considered a
%                     needle voxel
%
%   OUTPUT
%       thermalMapNoNeedle - currentThermalMap with zeros for needle voxels

thermalMapVol = zeros(size(currentBaseROI));
thermalMapVol(1+fSize:end-fSize,1+fSize:end-fSize,:) = currentThermalMap;
needlePtsROI = double(currentBaseROI<HUthreshold);

%will zero the points with the needle
thermalMapNoNeedle = thermalMapVol.*needlePtsROI;

end


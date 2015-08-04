function [ thermalMapNoNeedle ] = generateNoNeedleMap( currentBaseROI,currentThermalMap,fSize,HUthreshold )
%GENERATENONEEDLEMAP Summary of this function goes here
%   Detailed explanation goes here

thermalMapVol = zeros(size(currentBaseROI));
thermalMapVol(1+fSize:end-fSize,1+fSize:end-fSize,:) = currentThermalMap;
needlePtsROI = double(currentBaseROI<HUthreshold);

%will zero the points with the needle
thermalMapNoNeedle = thermalMapVol.*needlePtsROI;

end


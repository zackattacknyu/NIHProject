thermalMapVol = zeros(size(currentBaseROI));
thermalMapVol(1+fSize:end-fSize,1+fSize:end-fSize,:) = currentThermalMap;
needlePtsROI = double(currentBaseROI<HUthreshold);

%will zero the points with the needle
thermalMapNoNeedle = thermalMapVol.*needlePtsROI;
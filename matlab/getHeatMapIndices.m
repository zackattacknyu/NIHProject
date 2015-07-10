function [ controlInds,ablationInds ] = getHeatMapIndices( controlImage,ablationImage, wSize )
%GETHEATMAPINDICES Summary of this function goes here
%   Detailed explanation goes here

uiwait(msgbox('Select center where thermocouple is located'));
controlInds = getSelectionWindowInds(controlImage,wSize);

uiwait(msgbox('Select center of ablation zone'));
ablationInds = getSelectionWindowInds(ablationImage,wSize);

end


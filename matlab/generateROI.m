%{

This program works by thresholding the CT scan in order to only have points
    with high HU value as those will have the needle.

The threshold is the HU value used for this.

It then finds the connected components and considers the components with a
    sufficient number (defined by points threshold) of points to be the needles. 

%}

clear all;
SETUP3

threshold = 2500; %HU for needle
pointsThreshold = 100; %number of points before connected component is considered important
roiRadius = 60;

outputROI = getROIregions(fixedImg, threshold,pointsThreshold,roiRadius);


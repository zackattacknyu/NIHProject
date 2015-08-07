%{
REQUIRES:
    - Thermal map was generated with selected ROI
    - Baseline scan was loaded

This script takes the thermal map generated and puts it in a 3D volume
    that has the same size as the original baseline CBCT scan and is in 
    the same location.
In this way, the thermal map volume can be easily superimposed on the
    original volume to generate a 3D visual of the ablation zone
%}

%comes from prereqs for running program
maxCoords = roiMaxCoords{roiIndex};
minCoords = roiMinCoords{roiIndex};

rInds = minCoords(1):maxCoords(1); 
cInds = minCoords(2):maxCoords(2); 
zInds = minCoords(3):maxCoords(3);

diffFrameAll = zeros(size(baselineScan));
diffFrameAll(rInds,cInds,zInds)=currentThermalMap;
niiDiff = make_nii(diffFrameAll);
save_nii(niiDiff,'pt8_3DOverlayFiles/diffBlockAll_5002_5003.nii');
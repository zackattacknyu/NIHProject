%{
THIS SCRIPT IS RUN WHEN CT THERM STARTS

THIS ACTS AS THE CONFIG FILE FOR CTTHERM
CHANGE THE VALUES BELOW IF DESIRED. 
%}

%{
This defines the HU unit threshold. HU voxels above this value are counted
as needles or thermocouple and below this value they are counted as tissue.
%}
assignin('base','HUthreshold',1200);

%{
When needle detection is run, this is used as the least number of points in
a component before it is counted as being important. 
%}
assignin('base','pointsThreshold',50);

%{
When needle detection is run, it finds the N most significant components to
use as the needles or thermocouples. The value of N is determined by this
variable
%}
assignin('base','minNumNeedles',3);

%{
This is the radius (in pixels) around the needle used to obtain the ROI.
A box around the needle tip is taken, thus this defines the L-inf norm
distance. 
%}
assignin('base','roiRadius',30);



%{
DO NOT CHANGE THE VALUES BELOW
%}
assignin('base','nextManualROInum',1);
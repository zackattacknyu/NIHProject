%{
THIS SCRIPT IS RUN WHEN CT THERM STARTS

THIS ACTS AS THE CONFIG FILE FOR CTTHERM
CHANGE THE VALUES BELOW IF DESIRED. 
%}


%{
This defines the half-width of the window used in Conv Diff and 
    Spatial Offset Diff. The window will have a total size of N by N
    where N=2*fSize+1
%}
fSize=4;

%{
This defines the HU unit threshold. HU voxels above this value are counted
as needles or thermocouple and below this value they are counted as tissue.
%}
HUthreshold=1200;


%{
When needle detection is run, this is used as the least number of points in
a component before it is counted as being important. 
%}
pointsThreshold=50;


%{
When needle detection is run, it finds the N most significant components to
use as the needles or thermocouples. The value of N is determined by this
variable
%}
minNumNeedles=3;


%{
This is the radius (in pixels) around the needle used to obtain the ROI.
A box around the needle tip is taken, thus this defines the L-inf norm
distance. 
%}
roiRadius=30;

%{
When the regression is done, the neighborhood of points around the point selected
    to be the needle or thermocouple center is used. 
This is the radius of that neighborhood
%}
wSize=4;

%{
This is the degree of the polynomial used in the regression equation
%}
regressionPolyDegree=1;

%{
This is the initial temperature. The thermal map creates a map of changes
    in temperature. In order to generate a map of temperatures, each pixel
    value is added by this number.
%}
initialTemperature=37;


%{
DO NOT CHANGE THE CODE BELOW
%}
assignin('base','HUthreshold',HUthreshold);
assignin('base','pointsThreshold',pointsThreshold);
assignin('base','minNumNeedles',minNumNeedles);
assignin('base','roiRadius',roiRadius);
assignin('base','fSize',fSize);
assignin('base','wSize',wSize);
assignin('base','initialTemperature',initialTemperature);
assignin('base','regressionPolyDegree',regressionPolyDegree);
assignin('base','nextManualROInum',1);
assignin('base','nextTempPointNum',1);
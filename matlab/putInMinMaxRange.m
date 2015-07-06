function [ outputArray ] = putInMinMaxRange( array, minVal, maxVal )
%PUTINMINMAXRANGE Summary of this function goes here
%   Detailed explanation goes here

outputArray = array; 
outputArray(outputArray<minVal)=minVal;
outputArray(outputArray>maxVal)=maxVal;

end


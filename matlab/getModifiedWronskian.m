function [ wronskianArray1 ] = getModifiedWronskian( wronskianArray,maxVal )
%GETMODIFIEDWRONSKIAN Summary of this function goes here
%   Detailed explanation goes here

wronskianArray1 = wronskianArray;
wronskianArray1(wronskianArray1>maxVal)=maxVal;

end


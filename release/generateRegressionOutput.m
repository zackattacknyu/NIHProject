function [ coeff,xx,yy ] = generateRegressionOutput( diffVals,tempVals,degree )
%GENERATEREGRESSIONOUTPUT Summary of this function goes here
%   Detailed explanation goes here

coeff = polyfit(diffVals,tempVals,degree);
xx = linspace(min(diffVals),max(diffVals),20);
yy = polyval(coeff,xx);

end


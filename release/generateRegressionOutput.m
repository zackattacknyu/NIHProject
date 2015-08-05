function [ coeff,xx,yy ] = generateRegressionOutput( diffVals,tempVals,degree )
%GENERATEREGRESSIONOUTPUT performs regression on input values
%
%   INPUT:
%       diffVals - x values in regression
%       tempVals - y values in regression
%       degree - polynomial degree
%
%   OUTPUT
%       coeff - coefficients of regression curve found
%       xx - x values in regression curve
%       yy - y values in regression curve

coeff = polyfit(diffVals,tempVals,degree);
xx = linspace(min(diffVals),max(diffVals),20);
yy = polyval(coeff,xx);

end


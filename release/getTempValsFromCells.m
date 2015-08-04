function [ diffVals,tempVals ] = getTempValsFromCells( diffValsCell,tempValsCell )
%GETTEMPVALSFROMCELLS Summary of this function goes here
%   Detailed explanation goes here

temps = [tempValsCell{:}];
diffs = [diffValsCell{:}];

tempsRepeat = repmat(temps,size(diffs,1),1);

diffVals = diffs(:);
tempVals = tempsRepeat(:);


end


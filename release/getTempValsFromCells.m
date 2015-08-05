function [ diffVals,tempVals ] = getTempValsFromCells( diffValsCell,tempValsCell )
%GETTEMPVALSFROMCELLS Takes in the diffVals and tempVals cell arrays and
%                     makes column vectors for both
%
%   This assumes that tempValsCell is a cell array of size N where each
%       entry is a single temperature value. 
%   It also assumes that diffValsCell is a cell array of size N where each
%       entry is a column vector of difference values for the corresponding
%       temperature value in tempValsCell
%
%   INPUT:
%       diffValsCell - cell array of diff vals. 
%       tempValsCell - cell array of temp vals
%
%   OUTPUT
%       diffVals - vector of difference values
%       tempVals - vector of corresponding temp values

temps = [tempValsCell{:}];
diffs = [diffValsCell{:}];

tempsRepeat = repmat(temps,size(diffs,1),1);

diffVals = diffs(:);
tempVals = tempsRepeat(:);


end


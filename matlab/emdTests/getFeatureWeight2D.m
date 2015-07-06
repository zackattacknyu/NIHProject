function [ weight, feature ] = getFeatureWeight2D( patch )
%GETFEATUREWEIGHT Summary of this function goes here
%   Detailed explanation goes here

[numRows, numCol] = size(patch);
numEntries = numel(patch);
feature = ones(numEntries,2);
weight = zeros(numEntries,1);
index = 1;
for i = 1:numRows
   for j = 1:numCol
       weight(index) = patch(i,j);
      feature(index,:) = [i j];
      index = index + 1;
   end
end

end


function [ inds ] = getSelectionWindowInds( slice, wSize)
%GETSELECTIONWINDOWINDS Summary of this function goes here
%   Detailed explanation goes here

fcur = figure;
imagesc(slice)
[x, y] = ginput;
center = floor([y(1) x(1)]);
[rowCoords,colCoords]=meshgrid(center(1)-wSize:1:center(1)+wSize,center(2)-wSize:1:center(2)+wSize);
inds = sub2ind(size(slice),rowCoords(:),colCoords(:));
close(fcur)
end


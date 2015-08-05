function [ inds, row, col ] = getSelectionWindowInds( slice, wSize)
%GETSELECTIONWINDOWINDS Has user select point and then outputs the pixel
%                       indices for the ones around that point
%
%   INPUT:
%       slice - 2D image to obtain window indices for
%       wSize - half-width of window to use
%
%   OUTPUT
%       inds - linear indices of pixels in window
%       row - row coord for pixel selected
%       col - col coord for pixel selected

fcur = figure;
imagesc(slice)
[x, y] = ginput(1); row = y(1); col = x(1);
center = floor([y(1) x(1)]);
[rowCoords,colCoords]=meshgrid(center(1)-wSize:1:center(1)+wSize,center(2)-wSize:1:center(2)+wSize);
inds = sub2ind(size(slice),rowCoords(:),colCoords(:));
close(fcur)
end


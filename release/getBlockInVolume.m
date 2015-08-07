function [ outputBlock ] = getBlockInVolume( cbctScan,minCoords,maxCoords )
%GETBLOCKINVOLUME takes in scan and block coords and outputs the block
%
%   INPUT:
%       cbctScan - original volume
%       minCoords - minimum r,c,z block coords
%       maxCoords - maximum r,c,z block coords
%
%   OUTPUT
%       outputBlock - block from cbct scan

outputBlock = cbctScan(minCoords(1):maxCoords(1),...
        minCoords(2):maxCoords(2),...
        minCoords(3):maxCoords(3));


end


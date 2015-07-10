function [ P ] = putin01scale( P0 )
%PUTIN01SCALE Summary of this function goes here
%   Detailed explanation goes here

maxPix = max(P0(:));
minPix = min(P0(:));
P = (P0-minPix)/(maxPix-minPix);

end


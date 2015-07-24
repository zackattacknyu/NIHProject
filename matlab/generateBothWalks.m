function [ Xfor,Xback ] = generateBothWalks( i,j,numR,numC )
%GENERATEBOTHWALKS Summary of this function goes here
%   Detailed explanation goes here

minInds = ones(1,2);
maxInds = [numR numC];

rowDir = 1;
colDir = -1;
Xfor = generateCompleteWalk(i,j,minInds,maxInds,rowDir,colDir);

rowDir = -1;
colDir = 1;
Xback = generateCompleteWalk(i,j,minInds,maxInds,rowDir,colDir);

end


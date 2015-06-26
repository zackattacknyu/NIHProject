function [ filteredbackproj ] = getFilteredBackprojectImg( P )
%GETFILTEREDBACKPROJECTIMG Summary of this function goes here
%   Detailed explanation goes here

thetas = 0:0.5:179.5;
sino = myRadon(P,thetas);
backproj = myBackprojection(sino,thetas);
filteredbackproj = myFilteredBackprojection2DFT(backproj);

end


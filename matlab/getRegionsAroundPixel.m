function [ region1,region2 ] = getRegionsAroundPixel( frame1,frame2,i,j,sR )
%GETREGIONSAROUNDPIXEL Summary of this function goes here
%   Detailed explanation goes here

region1 = frame1((i-sR):(i+sR),(j-sR):(j+sR));
region2 = frame2((i-sR):(i+sR),(j-sR):(j+sR));

end


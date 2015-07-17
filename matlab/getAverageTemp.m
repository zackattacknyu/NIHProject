function [ avgTemp ] = getAverageTemp( tempImage,centerR,centerC,curRadius )
%GETAVERAGETEMP Summary of this function goes here
%   Detailed explanation goes here

centR = floor(centerR); centC = floor(centerC);
numR = size(tempImage,2);
numC = size(tempImage,1);
[rr, cc] = meshgrid(1:numR,1:numC);

includeMat = single((rr-centR).^2 + (cc-centC).^2 <= curRadius^2);
tempImageWithInc = tempImage.*includeMat;
tempsInRegion = tempImageWithInc(:); 
tempsInRegion = tempsInRegion(tempsInRegion>0);
avgTemp = mean(tempsInRegion);

end


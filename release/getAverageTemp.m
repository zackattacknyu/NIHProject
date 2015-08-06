function [ avgTemp ] = getAverageTemp( tempImage,centerR,centerC,curRadius )
%GETAVERAGETEMP gets average value in circular region
%
%   INPUT:
%       tempImage - image to obtain values from
%       centerR - row coord of center of circle to obtain values from
%       centerC - col coord of center of circle to obtain values from
%       curRadius - radius of circle to obtain values from
%
%   OUTPUT
%       avgTemp - average temperature in circlular region

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


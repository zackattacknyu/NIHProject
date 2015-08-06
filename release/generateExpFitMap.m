centerPtInVol = [58 54 23];
curRadius = 30;

%tempImage = currentThermalMap(:,:,centerPtInVol(3));
centR = centerPtInVol(1); centC = centerPtInVol(2);
numR = size(tempImage,2);
numC = size(tempImage,1);
[rr, cc] = meshgrid(1:numR,1:numC);

distanceMat = (rr-centR).^2 + (cc-centC).^2;
distances = distanceMat(:);
tempsInRegion = tempImage(:); 

indicesInclude = find(distances<curRadius^2);
distancesToInclude = distances(indicesInclude);
tempsToInclude = tempsInRegion(indicesInclude);

figure
plot(distancesToInclude,tempsToInclude,'bx');
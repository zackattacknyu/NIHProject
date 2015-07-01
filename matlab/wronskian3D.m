function [ WBlock ] = wronskian3D( baseBlock,currentBlock, sR,epsilon )
%WRONSKIAN Computes the wronskian change detector on two frames
%   frame1 - baseline frame
%   frame2 - current frame
%   sR - support radius

%sets up the wronskian frame
numRowsWBlock = size(baseBlock,1)-2*sR;
numColWBlock = size(baseBlock,2)-2*sR;
numFraWBlock = size(baseBlock,3)-2*sR;
WBlock = zeros(numRowsWBlock,numColWBlock,numFraWBlock);

%makes the wronskian frame
sN = (sR*2+1)^3; %support N, number of pixels in support region
for i = (1+sR):(numRowsWBlock-sR)
   for j = (1+sR):(numColWBlock-sR)
       for k = (1+sR):(numFraWBlock-sR)
          regionX = baseBlock((i-sR):(i+sR),(j-sR):(j+sR),(k-sR):(k+sR));
          regionY = currentBlock((i-sR):(i+sR),(j-sR):(j+sR),(k-sR):(k+sR));
          regionX = reshape(regionX,1,sN); regionY = reshape(regionY,1,sN);
          badEntries = find(abs(regionY)<epsilon);
          regionY(badEntries) = sign(regionY(badEntries))*epsilon;
          regionY(abs(regionY)<epsilon)=epsilon; %makes sure no div by zero error
          squaredSum = sum((regionX.^2)./(regionY.^2));
          normalSum = sum(regionX./regionY);
          wValue = (squaredSum+normalSum)/sN;
          WBlock(i,j) = wValue;
       end
   end
end


end


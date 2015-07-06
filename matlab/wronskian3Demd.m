function [ WBlock ] = wronskian3Demd( baseBlock,currentBlock, sR,epsilon )
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
for i = (1+sR):(numRowsWBlock-sR)
   for j = (1+sR):(numColWBlock-sR)
       for k = (1+sR):(numFraWBlock-sR)
          regionX = baseBlock((i-sR):(i+sR),(j-sR):(j+sR),(k-sR):(k+sR));
          regionY = currentBlock((i-sR):(i+sR),(j-sR):(j+sR),(k-sR):(k+sR));
          [wValue,~,~,~,~] = getQuadProgResult(regionX,regionY,0.1);
          WBlock(i,j,k) = wValue;
       end
   end
   i
end


end


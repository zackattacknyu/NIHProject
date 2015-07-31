function [ fixedImgConv ] = getAverageFilteredBlocks( fixedImg,filterSize )
%GETAVERAGEFILTEREDBLOCKS Summary of this function goes here
%   Detailed explanation goes here

filter = fspecial('average',filterSize);
fixedImgConv = zeros(size(fixedImg));
for k=1:size(fixedImg,3)
   fixedImgConv(:,:,k)=conv2(fixedImg(:,:,k),filter,'same');
end

end


function [ fixedImgConv ] = getAverageFilteredBlocks( fixedImg,filterSize )
%GETAVERAGEFILTEREDBLOCKS gets volume where each slice is convoluted with
%                         averaging filter
%
%   INPUT:
%       fixedImg - input volume
%       filterSize - Each slice will be filtered by convolution using n by
%                   n averaging filter. This value is used for n
%
%   OUTPUT
%       fixedImgConv - output block of filtered slices

filter = fspecial('average',filterSize);
fixedImgConv = zeros(size(fixedImg));
for k=1:size(fixedImg,3)
   fixedImgConv(:,:,k)=conv2(fixedImg(:,:,k),filter,'same');
end

end


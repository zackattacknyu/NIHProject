function [ fixedImgNoArt ] = get3DImgArtifactsRemoved( fixedImg )
%GET3DIMGARTIFACTSREMOVED Summary of this function goes here
%   Detailed explanation goes here

fixedImgNoArt = zeros(size(fixedImg));
for k = 1:size(fixedImg,3)
    fixedImgNoArt(:,:,k) = getImgArtifactsRemoved(fixedImg(:,:,k));
end

end


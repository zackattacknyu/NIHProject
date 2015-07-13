function [ segImageNew ] = changeSegImageCoords( segImage )
%CHANGESEGIMAGECOORDS This takes in the segmented images from ITK and
%       and puts the volume in the old coordinate system.
%
%   Goal is that the segmented image and the old image can be imposed over
%       each other

segImageNew = flip(flip(flip(segImage,1),2),3);
segImageNew = permute(segImageNew,[2 1 3]);

end


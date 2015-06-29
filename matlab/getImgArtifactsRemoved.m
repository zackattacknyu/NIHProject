function [ filteredbackproj ] = getImgArtifactsRemoved( P0 )
%GETIMGARTIFACTSREMOVED Summary of this function goes here
%   Detailed explanation goes here

maxPix = max(max(P0));
minPix = min(min(P0));
epsilon = 1;
P = (P0-minPix)/(maxPix-minPix);

thetas=0:179;
sino = myRadon(P,thetas);
backproj = myBackprojection(sino,thetas);

filteredbackproj0 = myFilteredBackprojection2DFT(backproj);

filteredbackproj1 = filteredbackproj0;
filteredbackproj1(filteredbackproj1<0)=0;
for i = 1:size(filteredbackproj1,1)
   for j=1:size(filteredbackproj1,2)
      if(P0(i,j)<=minPix+epsilon)
         filteredbackproj1(i,j)=0; 
      end
   end
end

center = size(filteredbackproj1)/2;
radius = center(1);
radFactor = 0.99;
for i = 1:size(filteredbackproj1,1)
   for j=1:size(filteredbackproj1,2)
       pt = [i j];
      if(norm(pt-center)>radius*radFactor)
         filteredbackproj1(i,j)=0; 
      end
   end
end

filteredbackproj = putin01scale(filteredbackproj1);
filteredbackproj = filteredbackproj*(maxPix-minPix) + minPix;



end


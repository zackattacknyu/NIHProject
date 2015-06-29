%P = phantom(128); 
P0 = dcmFixedHU(:,:,106);
maxPix = max(max(P0));
minPix = min(min(P0));
epsilon = 1;
P = (P0-minPix)/(maxPix-minPix);

%{
R = radon(P,0:179);
R(R>6e6)=0;
I1 = iradon(R,0:179);
I2 = iradon(R,0:179,'linear','none');
figure
subplot(1,3,1), imagesc(P), title('Original')
subplot(1,3,2), imagesc(I1), title('Filtered backprojection')
subplot(1,3,3), imagesc(I2), title('Unfiltered backprojection')
%}

%using my new function
%filteredbackproj = getFilteredBackprojectImg(P);

thetas=0:179;
sino = myRadon(P,thetas);
backproj = myBackprojection(sino,thetas);

filteredbackproj0 = myFilteredBackprojection2DFT(backproj);
%filteredbackproj2 = myFilteredBackprojectionCentralSlice(sino,0:0.5:179);
%filteredbackproj3 = myFilteredBackprojectionSpatialDomain(sino,0:0.5:179);

%{
filteredbackproj(filteredbackproj<0)=0;
filteredbackproj(filteredbackproj>4.5e5)=4.5e5;
filteredbackproj2(filteredbackproj2<0)=0;
filteredbackproj3(filteredbackproj3<0)=0;
%}

%%
filteredbackproj1 = filteredbackproj0;
filteredbackproj1(filteredbackproj1<0)=0;
for i = 1:size(filteredbackproj1,1)
   for j=1:size(filteredbackproj1,2)
      if(P0(i,j)<=minPix+epsilon)
         filteredbackproj1(i,j)=0; 
      end
   end
end

%%

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

%%
filteredbackproj = putin01scale(filteredbackproj1);

filteredbackproj = filteredbackproj*(maxPix-minPix) + minPix;
%filteredbackproj2 = putin01scale(filteredbackproj2);
%filteredbackproj3 = putin01scale(filteredbackproj3);

figure
imagesc(P0); colorbar;
title('Original');
figure
imagesc(filteredbackproj); colorbar;
title('Filtered Backproject using 2D FT');

%{
figure
imagesc(filteredbackproj2); colorbar;
title('Filtered Backproject using Central Slice');
figure
imagesc(filteredbackproj3); colorbar;
title('Filtered Backproject using Spatial Domain');
%}

%{
figure
imagesc(P); 
title('Original');
colormap gray;
colorbar;

figure
imagesc(filteredbackproj); 
colormap gray;
colorbar;
title('Filtered Backproject using 2D FT');
%}
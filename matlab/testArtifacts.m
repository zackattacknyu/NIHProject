%P = phantom(128); 
P = dcmRawFixed(:,:,118);
%%
R = radon(P,0:179);
R(R>6e6)=0;
I1 = iradon(R,0:179);
I2 = iradon(R,0:179,'linear','none');
figure
subplot(1,3,1), imagesc(P), title('Original')
subplot(1,3,2), imagesc(I1), title('Filtered backprojection')
subplot(1,3,3), imagesc(I2), title('Unfiltered backprojection')
%%
sino = myRadon(P,0:179);
backproj = myBackprojection(sino,0:179);
%%
filteredbackproj = myFilteredBackprojection2DFT(backproj);
filteredbackproj2 = myFilteredBackprojectionCentralSlice(sino,0:179);
filteredbackproj3 = myFilteredBackprojectionSpatialDomain(sino,0:179);

figure
imagesc(P); colorbar;
title('Original');
figure
imagesc(filteredbackproj); colorbar;
title('Filtered Backproject using 2D FT');
figure
imagesc(filteredbackproj2); colorbar;
title('Filtered Backproject using Central Slice');
figure
imagesc(filteredbackproj3); colorbar;
title('Filtered Backproject using Spatial Domain');
%%

%after post-processing above results
filteredbackproj(filteredbackproj<0)=0;
filteredbackproj2(filteredbackproj2<0)=0;
figure
imagesc(filteredbackproj); colorbar;
title('Filtered Backproject using 2D FT - No neg');
figure
imagesc(filteredbackproj2); colorbar;
title('Filtered Backproject using Central Slice - No neg');

%%
figure
imagesc(P);
colormap gray;
colorbar;

figure
imagesc(filteredbackproj)
colormap gray
colorbar
%P = phantom(128); 
P = dcmFixedHU(:,:,118);

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

filteredbackproj = getFilteredBackprojectImg(P);

%filteredbackproj2 = myFilteredBackprojectionCentralSlice(sino,0:179);
%filteredbackproj3 = myFilteredBackprojectionSpatialDomain(sino,0:179);
%{
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
%}

%filteredbackproj(filteredbackproj<0)=0;
%filteredbackproj(filteredbackproj>4.5e5)=4.5e5;

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

initSlice = baselineStack(:,:,106);

neigh = [3 3];
filteredSlice = medfilt2(initSlice,neigh);

sigma = 3;
hsize = 3;
filter = fspecial('gaussian',hsize,sigma);
gaussSlice = imfilter(initSlice,filter);

filter2 = fspecial('average',hsize);
gaussSlice2 = imfilter(initSlice,filter2);

initSlice2 = putin01scale(initSlice);
slice3 = bfilter2(initSlice2,1,sigma);

figure
imagesc(initSlice);
title('Initial Slice');
colorbar;

figure
imagesc(filteredSlice);
title('Median Filter Slice');
colorbar;

figure
imagesc(gaussSlice);
title('Gaussian Filter Slice');
colorbar;

figure
imagesc(gaussSlice);
title('Average Filter Slice');
colorbar;

figure
imagesc(slice3);
title('Bilateral Filter Slice');
colorbar;


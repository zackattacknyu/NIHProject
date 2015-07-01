dirName = 'timeSeries1_5005-5007/ser_5005/';
filename = strcat(dirName,'I0000001.dcm');

X = dicomread(filename);

%%
imagesc(X);
colorbar;

figure
imagesc(X>40000)
colorbar;

%{
THE FOLLOWING SECTION IS USED FOR THE REGISTRATION PICTURES

%}

%this is done on Pt 8, so SETUP2.m was run beforehand
sliceNum = 169;
centers = [31 125;317 151];
radii = [50 70];

fixedSlice = fixedImg(:,:,sliceNum);
movingSlice = movingImg(:,:,sliceNum);
movingRegSlice = movingImg3(:,:,sliceNum);

unregImage = zeros([size(fixedSlice) 3]);
regImage = zeros(size(unregImage));
unregImage(:,:,1) = putin01scale(movingSlice);
unregImage(:,:,2) = putin01scale(fixedSlice);
regImage(:,:,2) = putin01scale(fixedSlice);
regImage(:,:,1) = putin01scale(movingRegSlice);
figure
imshow(unregImage)
viscircles(centers,radii,'EdgeColor','w','LineStyle','-','LineWidth',3,'DrawBackgroundCircle',0);

%[x y] = ginput
figure
imshow(regImage)
viscircles(centers,radii,'EdgeColor','w','LineStyle','-','LineWidth',3,'DrawBackgroundCircle',0);
%{
figure
imagesc(fixedSlice);
colormap gray;
axis off;

figure
imagesc(movingImg(:,:,sliceNum));
colormap gray;
axis off;
%}

%This should be used in the paper to help justify the registration step
%{
figure
imagesc([fixedSlice movingSlice rawDiff]);
colormap gray
colorbar;
%}

%%
%{

THE FOLLOWING SECTION IS USED FOR THE CHANGE DETECTION PICTURES

%}


%this is done for Patient 9, so slice 144
sliceNum=144;
fixedSlice = fixedImg(:,:,sliceNum);
movingSlice = movingImg(:,:,sliceNum);
movingRegSlice = movingImg3(:,:,sliceNum);
%rawDiff = fixedSlice-movingSlice;
%rawDiffReg = fixedSlice-movingRegSlice;
figure
imagesc([fixedSlice movingRegSlice]);
rectX = 40; %starting col Index of ROI
rectY = 384-260; %ending row Index of ROI
sizeX = 210-40; %ROI num cols
sizeY = 260-140; %ROI num rows
rectX2 = rectX + 384;
%rectX3 = rectX2 + 384;
rectangle('Position',[rectX rectY sizeX sizeY])
rectangle('Position',[rectX2 rectY sizeX sizeY])
%rectangle('Position',[rectX3 rectY sizeX sizeY])
axis off;
%%
%must run the following:
%load('script7_13_pt9Values.mat');
slidWindowSliceNum = (sliceNum-zInds(1))+1;
rInds=140:260;cInds=40:210;
diffImageSlice = diffImageConv(:,:,sliceNum);
rawDiffSlice = movingRegSlice-fixedSlice;
rawDiffROI = rawDiffSlice(rInds,cInds);
diffImageROI = diffImageSlice(rInds,cInds);
diffFrameImage = sqrt(diffFrameBlock(:,:,slidWindowSliceNum));

rawROI = putin01scale(rawDiffROI(5:117,5:167));
convROI = putin01scale(diffImageROI(5:117,5:167));
slidROI = putin01scale(diffFrameImage);

figure
imagesc([rawROI convROI slidROI]);
axis off

%{
figure
imagesc(diffImageROI);
axis off
%colorbar;

figure
imagesc(sqrt(diffFrameImage));
axis off;
%colorbar;

figure
imagesc(rawDiffROI);
colormap gray
axis off;
%}


























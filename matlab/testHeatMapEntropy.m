%{

%8 seems to be a good filter size
for size=4:9
   imgFiltered = getAverageFilteredBlocks(fixedImg,size);
   imtool3D(imgFiltered);
end

%}

%%

%slice 144 has the ablation
% we use ginput to get the coords
sliceNum=144;

fixedImgSlice = fixedImg(:,:,sliceNum);
data = fixedImgSlice(:)+1200;
NN = length(data);
centers = 10:10:4200;
[yy1,xx1]=hist(data,centers); %bins by 10 HU

%10*(index) is value of center of bin cluster
fixedImgSliceProbMap = zeros(size(fixedImgSlice));
for i = 1:size(fixedImgSlice,1)
   for j = 1:size(fixedImgSlice,2)
       val = fixedImgSlice(i,j)+1200;
       ind = max(floor(val/10),1);
       fixedImgSliceProbMap(i,j) = yy1(ind)/NN;
       if(fixedImgSlice(i,j)<-1000)
          fixedImgSliceProbMap(i,j)=0; 
       end
   end
end



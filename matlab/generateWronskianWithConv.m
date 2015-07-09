
fixedImages = cell(1,6);
movingImages = cell(1,6);

for i = 1:3
    fixedImgConv = getAverageFilteredBlocks(fixedImg,i+7);
    movingImgConv = getAverageFilteredBlocks(movingImg3,i+7);
    
    fixedImages{i} = fixedImgConv;
    fixedImages{i+3} = putInMinMaxRange(fixedImgConv,0,1000);
    
    movingImages{i} = movingImgConv;
    movingImages{i+3} = putInMinMaxRange(movingImgConv,0,1000);
end

wronskianBlocks = cell(4,6);

sRvals = [1 2 4 8];
kc=1000;
for j=1:4
    for iNum=1:6
        iNum
        j
        datestr(now)
        
        wronskianBlocks{j,iNum} = wronskian3D(fixedImages{i}+kc,movingImages{i}+kc,sRvals(j),1);
        
        datestr(now)
   end
end

%%

fprintf(1,'I value:\n\n');
for i = 2:200
    numDigits = floor(log10(i))+1;
    for j=1:numDigits
        fprintf(1,'\b');
    end
    fprintf(1,'%d',i); pause(.1)
end
fprintf('\n')
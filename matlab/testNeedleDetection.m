threshold = 2900; %HU for needle
fixedImgNeedle = single(fixedImg>threshold);

needlePts = find(fixedImg>threshold);
%%
[rInd,cInd,zInd] = ind2sub(size(fixedImg),needlePts);

%%

coeff = pca([cInd rInd zInd]);

%%

needlecomp = coeff(:,1);
%%
xx = -300:300;
xx = xx';
xx = repmat(xx,[1 3]);
yy = needlecomp';
yy = repmat(yy,[601 1]);
res = yy.*xx;
%%

figure
plot3(cInd,rInd,zInd,'r.');
hold on
plot3(res(:,1),res(:,2),res(:,3),'bx')
hold off
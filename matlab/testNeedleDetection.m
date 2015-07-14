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

%data is for Patient 8 atm
xx = 0:300;
xx = xx';
xx = repmat(xx,[1 3]);
yy = needlecomp';
yy = repmat(yy,[301 1]);
res = yy.*xx;

offset = [155 109 207];
offset = repmat(offset,[301 1]);
res2 = res+offset;

figure
plot3(cInd,rInd,zInd,'r.');
hold on
plot3(res2(:,1),res2(:,2),res2(:,3),'bx')
hold off
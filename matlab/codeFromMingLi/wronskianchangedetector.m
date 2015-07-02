function wc = wronskianchangedetector(img1, img2, w)

img1pad=padarray(img1, [w w w], 'replicate');
img2pad=padarray(img2, [w w w], 'replicate');

[nr, nc, nz]=size(img1);
n=(2*w+1)^3;
lenwc=prod([nr, nc, nz]);
wc=zeros([nr, nc, nz]);
for i=1:lenwc
    [r,c,z]=ind2sub([nr, nc, nz], i);
    rind=r-w:r+w;
    cind=c-w:c+w;
    zind=z-w:z+w;
    subimg1=img1pad(rind+w,cind+w,zind+w);
    subimg2=img2pad(rind+w,cind+w,zind+w);
    frac=double(subimg1(:))./double(subimg2(:));
    tmp=sum(frac.^2)/n-sum(frac)/n;
    wc(r,c,z)=tmp;
end

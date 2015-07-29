function [ javaOutput ] = slidingWindowSquDiffJava( img1,img2,fSize )
%SLIDINGWINDOWSQUDIFFJAVA Summary of this function goes here
%   Detailed explanation goes here

img1Java = javaArray('java.lang.Double',size(img1,1),size(img1,2));
img2Java = javaArray('java.lang.Double',size(img2,1),size(img2,2));

for i = 1:size(img1,1)
    for j = 1:size(img1,2)
        img1Java(i,j) = java.lang.Double(img1(i,j));
        img2Java(i,j) = java.lang.Double(img2(i,j)); 
    end
end


fSizeJava = java.lang.Integer(fSize);

javaOutput = javaMethod('getWholeDiffImage','slidingwindow.WholeDiffImage',img1Java,img2Java,fSizeJava);

end


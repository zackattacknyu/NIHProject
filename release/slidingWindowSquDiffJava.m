function [ javaOutput ] = slidingWindowSquDiffJava( img1,img2,fSize )
%SLIDINGWINDOWSQUDIFFJAVA Finds sliding window difference for images
%
%   This finds the sliding window difference image between two images
%       It calls a Java method to perform the calculation
%   
%   INPUT:
%       img1 - first grayscale image
%       img2 - second grayscale image
%       fSize - half-width of window
%
%   OUTPUT:
%       javaOutput - difference image

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


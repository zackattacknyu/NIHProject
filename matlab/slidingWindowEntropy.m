function [ WFrame ] = slidingWindowEntropy( frame1,frame2, sR )
%WRONSKIAN Computes the wronskian change detector on two frames
%   frame1 - baseline frame
%   frame2 - current frame
%   sR - support radius

%sets up the wronskian frame
numRowsWFrame = size(frame1,1)-2*sR;
numColWFrame = size(frame1,2)-2*sR;
WFrame = zeros(numRowsWFrame,numColWFrame);

%makes the wronskian frame
epsilon=0.000001;
%sN = (sR*2+1)^2; %support N, number of pixels in support region
for i = (1+sR):(numRowsWFrame+sR)
   for j = (1+sR):(numColWFrame+sR)
      regionX = frame1((i-sR):(i+sR),(j-sR):(j+sR));
      regionY = frame2((i-sR):(i+sR),(j-sR):(j+sR));
      probsX = graycomatrix(regionX);
      probsY = graycomatrix(regionY);
      %WFrame(i,j) = propsX.Energy-propsY.Energy; %does not work
      probsX = probsX./(sum(probsX(:)));
      probsY = probsY./(sum(probsY(:)));
      
      probsXNoZero = probsX; 
      probsXNoZero(probsX==0)=epsilon; 
      
      probsYNoZero = probsY; 
      probsYNoZero(probsY==0)=epsilon;
      
      entriesX = log(probsXNoZero).*probsX;
      entriesY = log(probsYNoZero).*probsY;
      
      entropyX = -sum(entriesX(:)); 
      entropyY = -sum(entriesY(:));
      WFrame(i,j) = entropyY-entropyX;
   end
   i
end


end


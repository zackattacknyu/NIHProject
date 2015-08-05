function [ outputBlock ] = getSlidingWindowBlockJava( fixedROI, movingROI,fSize )
%GETSLIDINGWINDOWBLOCKJAVA Gets the sliding window difference block for an
%                                           ROI
%   INPUT:
%       fixedROI - region of interest for baseline image
%       movingROI - region of interest for comparison image
%       fSize - half-width
%
%   OUTPUT
%       diffFrameBlock - output block

numR = size(fixedROI,1)-2*fSize; 
numC = size(fixedROI,2)-2*fSize; 
numZ = size(fixedROI,3);

diffFrameBlock = zeros(numR,numC,numZ);

for k=1:numZ
    fixedSlice = fixedROI(:,:,k);
    movingSlice = movingROI(:,:,k);
    
    %{
    
    IMPORTANT NOTE:
    
    THIS GOES THROUGH EVERY SLICE AND CALLS THE JAVA PROGRAM FOR EVERY
        SLICE. IN THE FUTURE, IT WOULD BE GOOD IF BOTH ROI REGIONS WERE PUT
        INTO THE JAVA PROGRAM AND THE JAVA PROGRAM COMPUTED THE WHOLE
        BLOCK. 

    THERE WERE ISSUES GETTING JAVA AND MATLAB TO COMMUNICATE
        EFFECTIVELY WHEN THIS WAS LAST TRIED. 

    THE FOLLOWING JAVA PROGRAMS IN THE PACKAGE slidingwindow
        CONTAIN THE CODE IN PROGRESS TO ACCOMPLISH THIS:
        - WholeDiffBlock.java
        - WholeDiffBlockOld.java
    
    %}
    
    
    diffFrameBlock(:,:,k) = slidingWindowSquDiffJava(fixedSlice,movingSlice,fSize);
    
end

%{
diffFrameBlock now has the MSE of the window
We need the RMSE so we take the sqrt here
%}
outputBlock = sqrt(diffFrameBlock);

end


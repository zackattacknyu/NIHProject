function [ diffVals,tempVals ] = getDiffTempVals2( controlIndImage,ablationIndImage,...
    diffValsControlImage,diffValsAblationImage,...
    diffVals2ControlImage,diffVals2AblationImage,wSize,temps )
%GETDIFFTEMPVALS gets the change in temperature and change in HU values
%   controlIndImage - image used obtain indices for part of image where no
%                     heating was done
%   ablationIndImage -  image used obtain indices for part of image where 
%                     RF ablation heating was done
%   diffValsImage - first difference values image, usually the one where
%                   the probe was heated
%   diffValsImage2 - second difference values iamge, usually the one after
%                   the probe was cooled
%   wSize - the half-width of the window where difference values are taken
%   temps - 4 temperature changes that are important: 
%               temps(1): Temperature change for ablation zone in image 1
%               temps(2): temperature change for control zone in image 1
%               temps(3): temperature change for ablation zone in image 2
%               temps(4): temperature change for control zone in image 2

[controlInds,ablationInds] = getHeatMapIndices(controlIndImage,ablationIndImage,wSize);

diffValsAblation = diffValsAblationImage(ablationInds);
diffValsControl = diffValsControlImage(controlInds);
diffValsAblation2 = diffVals2AblationImage(ablationInds);
diffValsControl2 = diffVals2ControlImage(controlInds);

diffVals = [diffValsAblation;...
    diffValsControl;...
    diffValsAblation2;...
    diffValsControl2];
tempVals = [temps(1)*ones(length(diffValsAblation),1);...
    temps(2)*ones(length(diffValsControl),1);...
    temps(3)*ones(length(diffValsAblation2),1);...
    temps(4)*ones(length(diffValsControl2),1)];

end


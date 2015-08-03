load('pt9_slidingWindowValues.mat')
%%
[diffVals,tempVals] = getDiffTempVals(fixedSlice,diffFrameR,diffFrameR,diffFrameR2,wSize,temps);

%%

degree=1;
[coeff,xx,yy] = generateRegressionOutput(diffVals,tempVals,degree);
figure
plot(xx,yy);
hold on
plot(diffVals,tempVals,'rx');
xlabel('Sliding Window RMSE');
ylabel('Temperature Change (Celsius)');
hold off
%%
imtool3D(polyval(coeff,diffFrameR)+37);
imtool3D(polyval(coeff,diffFrameR2)+37);



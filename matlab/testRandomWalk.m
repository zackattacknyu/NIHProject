numR = 8;
numC = 8;
X0 = floor(rand(1,2).*[numR numC]) + [1 1];

Nsteps = 10;

XX = generateRandomWalk(numR,numC,X0,Nsteps);

figure; plot(XX(:,1),XX(:,2),'r-')

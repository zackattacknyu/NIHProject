
numR = 80;
numC = 40;
i = 40; %starting Row
j = 20; %starting Col

visited = false(numR,numC);

[Xfor,Xback] = generateBothWalks(i,j,numR,numC);


figure; 
plot(Xfor(:,1),Xfor(:,2),'r-');
hold on
plot(Xback(:,1),Xback(:,2),'b-');
hold off

indsFor = sub2ind(size(visited),Xfor(:,1),Xfor(:,2));
indsBack = sub2ind(size(visited),Xback(:,1),Xback(:,2));
visited(indsFor)=true; visited(indsBack)=true;

numVisited = sum(sum(single(visited)));
numEntries = numR*numC;
good = (numVisited==numEntries);

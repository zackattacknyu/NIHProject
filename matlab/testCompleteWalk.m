
numR = 50;
numC = 50;
X0 = [20 20];
Nsteps = 100;

visited = false(numR,numC);
visited(X0)=true;

XX = zeros(Nsteps+1,2);
XX(1,:) = X0;

minInds = ones(8,2);
maxInds = repmat([numR numC],8,1);

X0list = repmat(X0,8,1);

n=1;
m=1;
while n <= Nsteps   
    
    %m is current active step
    %   this varies from n-1 if there was backtracking
    i = XX(m,1);
    j = XX(m,2);
    
    neighbors = [i+1 j-1;i+1 j;i+1 j+1;...
        i j-1;i j+1;...
        i-1 j-1;i-1 j;i+1 j];
    
    %makes sure it does not go beyond boundary
    neighbors = max(minInds,neighbors);
    neighbors = min(maxInds,neighbors);

    linInds = sub2ind(size(visited),neighbors(:,1),neighbors(:,2));
    visitedNeigh = visited(linInds);
    
    distList = sum((neighbors-X0list).^2,2);
    unvisitedIndices = find(~visitedNeigh);
    validDistList = distList(unvisitedIndices);
    
    if(numel(unvisitedIndices)>0)
        
        bestIndices = find(validDistList==min(validDistList));
        bestIndicesShuffled = bestIndices(randperm(numel(bestIndices)));
        bestIndex = bestIndicesShuffled(1);
        
        nextMove = unvisitedIndices(bestIndex);
        nextStop = neighbors(nextMove,:);  
        visited(nextStop(1),nextStop(2))=true;
        
        %add entry to random walk
        n=n+1;
        XX(n,:) = nextStop;
        m=n;
    else
        
        %if there are no free neighbors, then backtrack to a spot with them
        m=m-1;
        
    end
    

end

figure; plot(XX(:,1),XX(:,2),'r-');


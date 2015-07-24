function [ XX ] = generateRandomWalk( numR,numC, X0,Nsteps )
%GENERATERANDOMWALK Summary of this function goes here
%   Detailed explanation goes here

%{
if true, then up,down,left,right are the directions
if false, then 8 directions are possible:
    the above 4 directions as well
    as the 4 diagonal directions

For now, this should be set to true. The random walks turn out to have
    better shapes when there are only 4 directions to choose from.
    This was concluded subjectively after evaluating around 200 random
    walks of both types created using this code. 
%}
fourDirWalk=true; 


visited = false(numR,numC);
visited(X0)=true;

XX = zeros(Nsteps+1,2);
XX(1,:) = X0;

if(fourDirWalk)
    minInds = ones(4,2);
    maxInds = repmat([numR numC],4,1);
else
    minInds = ones(8,2);
    maxInds = repmat([numR numC],8,1);
end

n=1;
m=1;
while n <= Nsteps   
    
    %m is current active step
    %   this varies from n-1 if there was backtracking
    i = XX(m,1);
    j = XX(m,2);
    
    if(fourDirWalk)
        neighbors = [i+1 j;i-1 j;i j+1;i j-1];
    else
        neighbors = [i+1 j-1;i+1 j;i+1 j+1;...
            i j-1;i j+1;...
            i-1 j-1;i-1 j;i+1 j];
    end
    
    %makes sure it does not go beyond boundary
    neighbors = max(minInds,neighbors);
    neighbors = min(maxInds,neighbors);

    linInds = sub2ind(size(visited),neighbors(:,1),neighbors(:,2));
    visitedNeigh = visited(linInds);

    unvisitedIndices = find(~visitedNeigh);
    if(numel(unvisitedIndices)>0)
        randIndex = floor(rand(1,1)*numel(unvisitedIndices))+1;
        nextMove = unvisitedIndices(randIndex);
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

end


function [ Xfor ] = generateCompleteWalk( i,j, minInds,maxInds,rowDir,colDir)
%GENERATECOMPLETEWALK Summary of this function goes here
%   Detailed explanation goes here

Xfor = zeros(prod(maxInds),2);
Xfor(1,:) = [i j];

n=1;

while(true)
        
    nextI = i+rowDir;
    nextJ = j+colDir;
    
    if(nextI>maxInds(1) || nextI<minInds(1))
        rowDir = rowDir*-1;
        if(nextJ>maxInds(2) || nextJ<minInds(2))
           break; 
        end
        j = nextJ;
    else
        i = nextI;
    end

    %add entry to walk
    n = n+1;
    Xfor(n,:) = [i j];
    
end


Xfor = Xfor(1:n,:);

end


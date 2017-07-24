function [adjs] = adjList(n0,F)
    %ADJLIST_FACE Compute an adjacency list from list of triangle vertex
    %indices.
    %
    % Inputs
    %   'n0'    the total number of vertices
    %   'tris'  list of triangle vertices
    %
    % Outputs
    %   'adjs'  cell array whose i-entry is a vector of the indices of the
    %     neighbours of i-th vertex
    
    adjs = cell(n0,1);
    
    for ii = 1:size(F,1)
        i = F(ii,1);
        j = F(ii,2);
        k = F(ii,3);
        adjs{i} = [adjs{i},j];
        adjs{j} = [adjs{j},k];
        adjs{k} = [adjs{k},i];
    end
    
end


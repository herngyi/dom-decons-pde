function [permuted] = permute_rows(mat,perm)
    %PERMUTE Summary of this function goes here
    %   Detailed explanation goes here
    
    n = size(perm);
    permuted = mat;
    
    for i = 1:n
        permuted(i,:) = mat(perm(i),:);
    end
    
end


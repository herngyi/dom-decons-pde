function [permuted] = permute_rows(mat,perm)
    %PERMUTE Permutes the rows of a matrix according to the supplied
    %permutation.
    %
    % Inputs:
    %   mat   matrix whose rows are to be permuted
    %   perm  permutation vector, representing i -> j by perm(i) == j.
    
    n = size(perm);
    permuted = mat;
    
    for i = 1:n
        permuted(i,:) = mat(perm(i),:);
    end
    
end


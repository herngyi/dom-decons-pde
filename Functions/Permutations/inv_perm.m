function [inverted] = inv_perm(perm)
    %INV_PERMUTATION Summary of this function goes here
    %   Detailed explanation goes here
    
    inverted = perm;
    
    for i = 1:length(perm)
        inverted(perm(i)) = i;
    end
    
end


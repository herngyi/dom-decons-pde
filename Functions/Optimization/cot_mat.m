function [C] = cot_mat(V,F)
    %COT_MAT Computes the cotangent matrix C from the following:
    %
    % L := Laplacian,
    % M := Mass matrix,
    % C := Cotangent matrix,
    % E(u) := Dirichlet energy of u,
    %
    % L == inv(M)C,
    % E(u) == u'*C*u/2.
    %
    % Inputs:
    %   'V'  list of vertices
    %   'F'  list of triangles, represented by the indices of their
    %     vertices
    %
    % Outputs:
    %   'C'  #verts by #verts cotangent matrix
    
    n = size(V,1);
    C = zeros(n);
    
    % off-diagonal entries
    for ii = 1:size(F,1)
        i = F(ii,1);
        j = F(ii,2);
        k = F(ii,3);
        angs = angles(V(i,:),V(j,:),V(k,:));
        C(j,k) = C(j,k) - cot(angs(1))/2;
        C(k,j) = C(k,j) - cot(angs(1))/2;
        C(k,i) = C(k,i) - cot(angs(2))/2;
        C(i,k) = C(i,k) - cot(angs(2))/2;
        C(i,j) = C(i,j) - cot(angs(3))/2; 
        C(j,i) = C(j,i) - cot(angs(3))/2; 
    end

    % diagonal entries
    C = C - diag(sum(C,2));
    
end


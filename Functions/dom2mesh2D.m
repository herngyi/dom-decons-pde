function [V,F,N,n_bd] = dom2mesh2D(bdverts)
    %DOM2MESH2D Generates a high-quality triangular mesh for the convex hull
    %of the input points, and returns topological info.
    %
    % Inputs:
    %   'bdverts'  k by 2 list of points
    %
    % Outputs:
    %   'V'  #V by 2 list of mesh vertices, boundary vertices listed
    %     before interior vertices
    %   'F'  #F by 3 list of triangle vertex indices
    %   'N'  #N by 3 list of triangle neighbours

    area = polyarea(bdverts(:,1),bdverts(:,2));
    [V,F,N,bd] = triangle_top(bdverts,'Quality',20,'MaxArea',area/100);

    n_bd = sum(bd);
    perm = bd_perm(bd, n_bd, length(bd)-n_bd);
    V = permute_rows(V,perm);
    invp = inv_perm(perm);
    F = arrayfun(@(i) invp(i), F);

end
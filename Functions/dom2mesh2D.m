function [verts,tris,nbs,n_bd] = dom2mesh2D(bdverts)
    %DOM2MESH Summary of this function goes here
    %   Detailed explanation goes here

    area = polyarea(bdverts(:,1),bdverts(:,2));
    [verts,tris,nbs,bd] = triangle_top(bdverts,'Quality',20,'MaxArea',area/50);

    n_bd = sum(bd);
    perm = bd_perm(bd, n_bd, length(bd)-n_bd);
    verts = permute_rows(verts,perm);
    inv = inv_perm(perm);
    tris = arrayfun(@(i) inv(i), tris);

end
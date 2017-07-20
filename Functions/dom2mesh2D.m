function [tris,verts,nbs] = dom2mesh2D(bdverts)
%DOM2MESH Summary of this function goes here
%   Detailed explanation goes here

area = polyarea(bdverts(:,1),bdverts(:,2));
[verts,tris,nbs] = triangle(bdverts,'Quality',30,'MaxArea',area/50);

end
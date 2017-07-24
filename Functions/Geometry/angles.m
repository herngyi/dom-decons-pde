function [angs] = angles(a,b,c)
    %ANGLES Computes the angles at each vertex of the input triangle.
    
    u = c - b;
    v = a - c;
    w = b - a;
    u = u/norm(u);
    v = v/norm(v);
    w = w/norm(w);
    
    angs = acos([-dot(v,w), -dot(w,u), -dot(u,v)]);
    
end


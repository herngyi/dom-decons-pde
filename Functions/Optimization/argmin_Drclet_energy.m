function [u] = argmin_Drclet_energy(V,F,u_bd)
    %ARGMIN_DRCLET_ENERGY Finds the mesh functional
    %that minimizes the discretized Dirichlet energy.
    %   
    % Inputs:
    %   'V'  #V by 2 list of mesh vertices, boundary vertices listed
    %     before interior vertices
    %   'F'  #F by 3 list of triangle vertex indices
    %
    % Outputs:
    %   'u'  #V by 1 list of functional values on
    %     mesh vertices
    
    n0 = size(V,1);
    n_bd = size(u_bd,1);

    C = cot_mat(V,F);
    C_int_int = C(n_bd+1:n0, n_bd+1:n0);
    C_int_bd = C(n_bd+1:n0, 1:n_bd);

    u_int = linsolve(C_int_int,-C_int_bd*u_bd);
    u = [u_bd; u_int];
    
    %{ Minimizing Dirichlet energy via quadratic
         programming
    Aeq = diag([ones(1,n_bd), zeros(1,n0 - n_bd)]);
    beq = [u_bd; zeros(n0 - n_bd,1)];
    u = quadprog(C,zeros(n0,1),zeros(n0),...
          zeros(n0,1), Aeq,beq);
    %}
    
    
       
end


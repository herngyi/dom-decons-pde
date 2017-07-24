function [perm] = bd_perm(indicator,n_bd,n_int)
  %BD_PERM Finds a permutation that would bring all boundary vertices
  %before internal vertices.
  %
  % Inputs:
  %   'indicator'  vector of 0's and 1's; if the i-th vertex is a boundary
  %     vertex then 'indicator(i) == 1', otherwise 'indicator(i) == 0'.
  %   'n_bd'   number of boundary vertices
  %   'n_int'  number of internal vertices
  %
  % Outputs:
  %   'perm'  permutation i -> j represented by 'perm(i) == j'

  bd_indices  = zeros(n_bd, 1);
  int_indices = zeros(n_int,1);
  
  bd_insert  = 1;
  int_insert = 1;
  
  % sorts boundary and interior vertices into vectors bd_indices and
  % int_indices
  for i = 1:n_bd + n_int
      if indicator(i) == 1
          bd_indices(bd_insert) = i;
          bd_insert = bd_insert + 1;
      else
          int_indices(int_insert) = i;
          int_insert = int_insert + 1;
      end
  end

  perm = [bd_indices; int_indices];
  
end


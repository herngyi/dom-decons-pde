function [perm] = bd_perm(indicator,n_bd,n_int)
  %REINDEX_BD Summary of this function goes here
  %   Detailed explanation goes here

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


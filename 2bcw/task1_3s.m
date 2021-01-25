%
% Versin 0.9  (HS 06/03/2020)
%
function task1_3s(Cov)
% Input:
%  Cov : D-by-D covariance matrix (double)
% Variales to save:
%  EVecs : D-by-D matrix of column vectors of eigen vectors (double)  
%  EVals : D-by-1 vector of eigen values (double)  
%  Cumvar : D-by-1 vector of cumulative variance (double)  
%  MinDims : 4-by-1 vector (int32)  

  [V,D] = eig(Cov);
  [EVals,ind] = sort(diag(D),'descend');
  EVecs = V(:,ind);
  for i = 1:length(EVecs)
      if EVecs(1,i) < 0
          EVecs(1,i) = EVecs(1,i) * (-1);
      end
  end
  save('t1_EVals.mat', 'EVals');
  save('t1_EVecs.mat', 'EVecs');
  x = size(EVals,1);
  Cumvar = zeros(x,1);
  Cumvar(1,1) = EVals(1,1);
  for i = 2:x
      Cumvar(i,1) = Cumvar(i-1,1) + EVals(i,1);
  end
  
  MinDims = zeros(4,1);
  last = Cumvar(x,1);
  n1 = 0.7 * last;
  n2 = 0.8 * last;
  n3 = 0.9 * last;
  n4 = 0.95 * last;
  
  for i = 1:x
      if n1 < Cumvar(i,1)
          MinDims(1,1) = i;
          break;
      end
  end
  for i = 1:x
      if n2 < Cumvar(i,1)
          MinDims(2,1) = i;
          break;
      end
  end
  for i = 1:x
      if n3 < Cumvar(i,1)
          MinDims(3,1) = i;
          break;
      end
  end
  for i = 1:x
      if n4 < Cumvar(i,1)
          MinDims(4,1) = i;
          break;
      end
  end
  
  save('t1_Cumvar.mat', 'Cumvar');
  save('t1_MinDims.mat', 'MinDims');
end

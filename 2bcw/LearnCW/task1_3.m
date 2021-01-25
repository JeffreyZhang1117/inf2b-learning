%
% Versin 0.9  (HS 06/03/2020)
%
function task1_3(Cov)
% Input:
%  Cov : D-by-D covariance matrix (double)
% Variales to save:
%  EVecs : D-by-D matrix of column vectors of eigen vectors (double)  
%  EVals : D-by-1 vector of eigen values (double)  
%  Cumvar : D-by-1 vector of cumulative variance (double)  
%  MinDims : 4-by-1 vector (int32)  
  
 [V,D] = eig(Cov);
 [d,ind] = sort(diag(D),'descend');
  Vs = V(:,ind);
  for j = 1:size(Vs,1)
      if Vs(1,j) <= 0
          Vs(:,j) = Vs(:,j) *(-1);
      end
  end
  
  EVecs = Vs;
  EVals = d;
 
 
 
 Cumvar = cumsum(EVals);  %Find the cumulative sum of the columns of EVals
 
 MinDims = zeros(4,1);
 n = Cumvar(size(Cov,2),1); %last value of columns of EVals
 MinDims(1,1) = findI(n*0.7,Cumvar); % each column represents an attribute, also called dimension
 MinDims(2,1) = findI(n*0.8,Cumvar); % so we should calculate how many column could included.
 MinDims(3,1) = findI(n*0.9,Cumvar);
 MinDims(4,1) = findI(n*0.95,Cumvar);
 
  plot(Cumvar);
  xlabel('number of dimensions'); 
  ylabel('variance');

  save('t1_EVecs.mat', 'EVecs');
  save('t1_EVals.mat', 'EVals');
  save('t1_Cumvar.mat', 'Cumvar');
  save('t1_MinDims.mat', 'MinDims');
end
  function res = findI(x,yz)
   res = 0;
   for i = 1:size(yz,1)
      if x < yz(i,1)
          res = i;
         break;
      end
   end
  end

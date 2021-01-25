%
% Versin 0.9  (HS 06/03/2020)
%
function task1_1s(X, Y)
% Input:
%  X : N-by-D data matrix (double)
%  Y : N-by-1 label vector (int32)
% Variables to save
%  S : D-by-D covariance matrix (double) to save as 't1_S.mat'
%  R : D-by-D correlation matrix (double) to save as 't1_R.mat'
  P = X;
  [N,D] = size(P);
  
  [I, J] = size(P);
  c = zeros(1, J); 
  for i = 1:I
    for j = 1:J
        c(j) = c(j) + P(i,j);
    end
  end
  c  = c/I;
  
  for i = 1:D
      for j = 1:N
          P(j,i) =  P(j,i) - c(i);
      end
  end
  
  S = (1/N) * (P' * P);

  G = S;
  R = zeros(D,D);
  for i = 1:D
      R(i,i) = G(i,i);
  end
  
  R = sqrt(R);
  Rinv = inv(R);
  R = Rinv * G * Rinv;

  save('t1_S.mat', 'S');
  save('t1_R.mat', 'R');
end

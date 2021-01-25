    %
% Versin 0.9  (HS 06/03/2020)
%
function task1_1(X, Y)% Input:
%  X : N-by-D data matrix (double)
%  Y : N-by-1 label vector (int32)
% Variables to save
%  S : D-by-D covariance matrix (double) to save as 't1_S.mat'
%  R : D-by-D correlation matrix (double) to save as 't1_R.mat'
  
  
   
  for i = 1 : size(X,2)
      for j = 1 :size(X,2)
       meani = (1/size(X,1)*sum(X(:,i)));
       meanj = (1/size(X,1)*sum(X(:,j)));
       S(i,j) = sum((X(:,i)-meani).* (X(:,j)-meanj)) / (size(X,1));
       end
  end
  
  for i = 1 : size(X,2)
     for j = 1 :size(X,2)
       R(i,j) = S(i,j) / sqrt(S(i,i) * S(j,j));
     end
  end
 
  
  
  %imagesc(R)
  %colormap('jet')
  save('t1_S.mat', 'S');
  save('t1_R.mat', 'R');
end

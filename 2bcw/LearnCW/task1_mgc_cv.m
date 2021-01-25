%
% Versin 0.9  (HS 06/03/2020)
%
function task1_mgc_cv(X, Y, CovKind, epsilon, Kfolds)
% Input:
%  X : N-by-D matrix of feature vectors (double)
%  Y : N-by-1 label vector (int32)
%  CovKind : scalar (int32)
%  epsilon : scalar (double)
%  Kfolds  : scalar (int32)

  N = zeros(max(Y),1);  %class number
  
  for i = 1 : size(X,1)
     for j =1 : size(N,1)
       if Y(i) == j
          N(j) = N(j) +1;
       end
     end
  end
 
  
  PMap = zeros(size(X,1),1);   %PMap
  
  for i = 1: size(N,1)     % for class 
          a = find(Y == i);
          Mc = floor(double(N(i))/ double(Kfolds));
          for j = 1 : (Kfolds-1)
            for k =1 : (Mc * j)
              if PMap(a(k)) == 0
                 PMap(a(k)) = j;
              end
            end
          end
          for z = (Mc*(Kfolds-1)+1) : size(a,1)
             PMap(a(z)) = Kfolds;
          end
          
  end
  
  
 
  
  totalCM = zeros(size(N,1),size(N,1));
  for p = 1: Kfolds   %  for each p
     
      
    Ms = zeros(max(Y),size(X,2));
    Covs = zeros(size(X,2),size(X,2),max(Y));
    temp = zeros(size(X,2),size(X,2));
    
    for c =1 : max(Y)  %  for each class 1-10
      %get the trainning data
      X_train = X(Y == c & PMap ~= p,:);
      sz = size(X_train,1);
      mult = ones(1, sz);
      
      %calculate the mean
      Ms(c,:) = (mult * X_train) ./ sz; 
     %difference between each sample and mean
      diff = X_train - repmat(Ms(c,:),sz,1);
      %calculate the covariance
      Covs(:,:,c) = diff' * diff ./ sz;
      Covs(:,:,c) = Covs(:, :,c) + (epsilon .* eye(size(X,2)));  
    end
    
    %calculate diagnoal convariance matrix
     if CovKind == 2
        for c =1 : max(Y)
          Covs(:,:,c) = diff' * diff ./ sz;
          Covs(:,:,c) = Covs(:, :,c) + (epsilon .* eye(size(X,2)));
          Covs(:,:,c) = diag(diag(Covs(:,:,c)));
          
       end
    end
    % calculate shared covariance matrix
     if CovKind == 3
       for i =1 : max(Y)
        temp = temp + Covs(:,:,i);
       end
       for j =1 :max(Y)
        Covs(:,:,j) = temp ./ size(N,1);
       end
     end
   
     %calculate confusion matrix
    X_test = X(PMap == p,:); % N-by-D test data matrix (double)
    test_prob = zeros(size(X_test,1),size(N,1));
    piror = zeros(max(Y),1);  %prior
    for i = 1 : size(N,1)  %iterate for each class
      piror(i) = N(i) ./ sum(N(:,:));
    end
    
    for class = 1 : size(N,1)
        like_k = gaussianMV(Ms(class,:),Covs(:,:,class),X_test);
        test_prob(:,class) = like_k * piror(class);
    end
    
     [~,Y_preds] = max(test_prob,[],2);
     
     
     Ytrues = Y(PMap == p); 
     CM = zeros(size(N,1));
    for i=1:size(Ytrues,1)
        CM(Ytrues(i), Y_preds(i)) = CM(Ytrues(i), Y_preds(i)) + 1;
    end
    
    % nomorlise the confusion matrix
    NorCM = double(CM) ./ sum(sum(CM));
    totalCM = totalCM + NorCM;
    
    save(sprintf('t1_mgc_<%d>cv<%d>_Ms.mat',Kfolds,p), 'Ms');
    save(sprintf('t1_mgc_<%d>cv<%d>_ck<%d>_Covs.mat',Kfolds,p,CovKind), 'Covs');
    save(sprintf('t1_mgc_<%d>cv<%d>_ck<%d>_CM.mat',Kfolds,p,CovKind), 'CM');
          
  end
  
   %find final confusion matrix
    CM = totalCM ./ Kfolds;
    save(sprintf('t1_mgc_<%d>cv<%d>_ck<%d>_CM.mat',Kfolds,(Kfolds+1),CovKind), 'CM');
%    
%
% Variables to save
%  PMap   : N-by-1 vector of partition numbers (int32)
%  Ms     : C-by-D matrix of mean vectors (double)
%  Covs   : C-by-D-by-D array of covariance matrices (double)
%  CM     : C-by-C confusion matrix (double)
  
   save(sprintf('t1_mgc_<%d>cv_PMap.mat',Kfolds), 'PMap');
    %For each <p> and <CovKind>
%    save('t1_mgc_<Kfolds>cv<p>_Ms.mat', 'Ms');
%    save('t1_mgc_<Kfolds>cv<p>_ck<CovKind>_Covs.mat', 'Covs');
%    save('t1_mgc_<Kfolds>cv<p>_ck<CovKind>_CM.mat', 'CM');
   % save('t1_mgc_<Kfolds>cv<L>_ck<CovKind>_CM.mat', 'CM');
  % NB: replace <Kfolds>, <p>, and <CovKind> properly.

end

function y = gaussianMV(mu,covar,X)
   [n,d] = size(X);
   [j,k] = size(covar);
    
   if( (j~=d) || (k ~=d ))
       error('dimension of covariance matrix and data should match');
   end
    
   invcov = inv(covar);
   mu = reshape(mu,1,d);
    
    
   X = X - ones(n,1).* mu;
   fact = sum(((X *invcov).*X),2);
    
   y = exp(-0.5*fact);
   y = y./ sqrt((2*pi)^d*det(covar));
   end  
    
    
    
    
    


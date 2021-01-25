%
% Versin 0.9  (HS 06/03/2020)
%
function [Y] = task2_sNeuron(W, X)
% Input:
%  X : N-by-D matrix of input vectors (in row-wise) (double)
%  W : (D+1)-by-1 vector of weights (double)
% Output:
%  Y : N-by-1 vector of output (double)
    [N,~] = size(X);
    a = ones(N,1);
    Xa = [a X];
    Y = zeros(N,1);
    for i =1 : N
        a = transpose(W) * transpose(Xa(i,:));
        Y(i) = 1 / (1 + exp(-a));
    end

end



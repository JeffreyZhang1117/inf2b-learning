%
% Versin 0.9  (HS 06/03/2020)
%
function [Y] = task2_hNeuron(W, X)
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
        if  transpose(W) * transpose(Xa(i,:)) > 0
            Y(i) = 1;
        else
            Y(i) = 0;
        end
    end

 
end

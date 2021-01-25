%
% Versin 0.9  (HS 06/03/2020)
%
function [Y] = task2_hNN_A(X)
% Input:
%  X : N-by-D matrix of input vectors (in row-wise) (double)
% Output:
%  Y : N-by-1 vector of output (double)
   W1 = [1,0.0141,-0.2561];
   W2 = [-1,0.2383,0.0519];
   W3 = [-1,-0.3289,0.6694];
   W4 = [1,-0.2359,-0.0201];
  
% 
  W5  = [-3,1,1,1,1];

   output1 = task2_hNeuron(W1',X);
   output2 = task2_hNeuron(W2',X);
   output3 = task2_hNeuron(W3',X);
   output4 = task2_hNeuron(W4',X);
   final = [output1,output2,output3,output4];
   save('final.mat','final');
   Y = task2_hNeuron(W5',final);
   
   save('Y.mat','Y');
   
   
   
   
end

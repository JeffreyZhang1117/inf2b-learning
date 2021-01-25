function [Y] = task2_hNN_B(X)
  % Input:
%  X : N-by-D matrix of input vectors (in row-wise) (double)
% Output:
%  Y : N-by-1 vector of output (double)
  W2 = [49.2297,-9.6186,1];
  W3 = [-12.9642,3.0818,1];
  W4 = [-3.8060,0.4026,1];
  W1 = [4.6017,0.2264,-1];
  
  
% 
  W5  = [-2,1,1,0.2,0.2];

   output1 = task2_hNeuron(W1',X);
   output2 = task2_hNeuron(W2',X);
   output3 = task2_hNeuron(W3',X);
   output4 = task2_hNeuron(W4',X);
   final = [output1,output2,output3,output4];
   save('final.mat','final');
   Y = task2_hNeuron(W5',final);
   
   save('Y.mat','Y');
%    
%    W11 = [49.2297,-9.6186,1];
%    W12 = [-3.8060,0.4026,1];
%    W13 = [4.6017,0.2264,-1];
%    W14  = [-2,1,1,1];
%    output1 = task2_hNeuron(W11',X);
%    output2 = task2_hNeuron(W12',X);
%    output3 = task2_hNeuron(W13',X);
%   
%    layer1= [output1,output2,output3];
%    Y1 = task2_hNeuron(W14',layer1);
%   
%     save('test1','Y1');
%     
% %find B2
%     
%    W15 = [49.2297,-9.6186,1];
%    W16 = [-12.9642,3.0818,1];
%    W17 = [3.8060,-0.4026,-1];
%    output5 = task2_hNeuron(W15',X1);
%    output6 = task2_hNeuron(W16',X1);
%    output7 = task2_hNeuron(W17',X1);
%    
%    layer2 = [output5,output6,output7];
%    W18  = [-2,1,1,1];
%    Y2 = task2_hNeuron(W18',layer2);
%    
%    save('X1','X1');
%    save('test2','Y2')

end


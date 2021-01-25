%
% Versin 0.9  (HS 06/03/2020)
%
function [Y] = task2_hNN_AB(X)
% Input:
%  X : N-by-D matrix of input vectors (in row-wise) (double)
% Output:
%  Y : N-by-1 vector of output (double)
% A 

   Wa01 = [3.9045,00.0551,-1];
   Wa02 = [-19.2707,4.5922,1];
   Wa03 = [-1.4938,-0.4913,1];
   Wa04 = [49.6494,-11.7129,-1];

  %B
   Wb01 = [4.6017,0.2264,-1];
   Wb02 = [49.2297,-9.6186,1];
   Wb03 = [-12.9642,3.0818,1];
   Wb04 = [-3.8060,0.4026,1];
   
   output1 = task2_hNeuron(Wa01',X);
   output2 = task2_hNeuron(Wa02',X);
   output3 = task2_hNeuron(Wa03',X);
   output4 = task2_hNeuron(Wa04',X);
   output5 = task2_hNeuron(Wb01',X);
   output6 = task2_hNeuron(Wb02',X);
   output7 = task2_hNeuron(Wb03',X);
   output8 = task2_hNeuron(Wb04',X);
   
   layer1= [output1,output2,output3,output4,output5,output6,output7,output8];
   
   Wa10 = [4,-1,-1,-1,-1,0,0,0,0];
   
   Wb10 = [-2,0,0,0,0,1,1,0.2,0.2];
   
   output9 = task2_hNeuron(Wa10',layer1);
   output10 = task2_hNeuron(Wb10',layer1);
   
   finial = [output9,output10];
   
   finalW = [-1,1,1];
   Y = task2_hNeuron(finalW',finial);
   save('Y.mat','Y');
  
  
  
  
  
  
  

end

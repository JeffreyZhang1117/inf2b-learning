%
% Versin 0.9  (HS 06/03/2020)
%
function [Y] = task2_sNN_AB(X)
% Input:
%  X : N-by-D matrix of input vectors (double)
% Output:
%  Y : N-by-1 vector of output (double)
% find B1
  % A 
   Wa01 = [3.9045,00.0551,-1]*1000;
   Wa02 = [-19.2707,4.5922,1]*1000;
   Wa03 = [-1.4938,-0.4913,1]*1000;
   Wa04 = [49.6494,-11.7129,-1]*1000;

  %B
   Wb01 = [4.6017,0.2264,-1]*1000;
   Wb02 = [49.2297,-9.6186,1]*1000;
   Wb03 = [-12.9642,3.0818,1]*1000;
   Wb04 = [-3.8060,0.4026,1]*1000;
   
   output1 = task2_sNeuron(Wa01',X);
   output2 = task2_sNeuron(Wa02',X);
   output3 = task2_sNeuron(Wa03',X);
   output4 = task2_sNeuron(Wa04',X);
   output5 = task2_sNeuron(Wb01',X);
   output6 = task2_sNeuron(Wb02',X);
   output7 = task2_sNeuron(Wb03',X);
   output8 = task2_sNeuron(Wb04',X);
   
   layer1= [output1,output2,output3,output4,output5,output6,output7,output8];
   
   Wa10 = [2.5,-1,-1,-0.5,-0.5,0,0,0,0]*1000;
   
   Wb10 = [-2.1,0,0,0,0,1,1,0.2,0.2]*1000;
   
   output9 = task2_sNeuron(Wa10',layer1);
   output10 = task2_sNeuron(Wb10',layer1);
   
   finial = [output9,output10];
   
   finalW = [-1,1,1]*1000;
   Y = task2_sNeuron(finalW',finial);

   save('Y.mat','Y');


  
end

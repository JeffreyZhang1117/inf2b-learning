%
% Versin 0.9  (HS 06/03/2020)
%
% template script task2_find_hNN_A_weights.m
%
function task2_find_hNN_A_weights(poly)
    %find line (1,2),(1,4),(2,3),(3,4)
    coef = [];
    
    coef12 = polyfit([poly(1,1),poly(2,1)],[poly(1,2),poly(2,2)],1);
    coef = [coef;coef12];
    
    coef23 = polyfit([poly(2,1),poly(3,1)],[poly(2,2),poly(3,2)],1);
    coef = [coef;coef23];
    
    coef34 = polyfit([poly(3,1),poly(4,1)],[poly(3,2),poly(4,2)],1);
    coef = [coef;coef34];
   
    coef14 = polyfit([poly(1,1),poly(4,1)],[poly(1,2),poly(4,2)],1);
    coef = [coef;coef14];
    
    save('poly.mat','coef');
end







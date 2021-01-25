%
% Versin 0.9  (HS 06/03/2020)
%
% template script for task2_plot_regions_hNN_A.m
function task2_plot_regions_hNN_A(xmin,xmax,ymin,ymax)


   Xplot = linspace(xmin, xmax, 1000);
   Yplot = linspace(ymin, ymax, 1000);
   [Xv,Yv] = meshgrid(Xplot, Yplot);
   grid = [Xv(:), Yv(:)];
   Z = task2_hNN_A(grid);
   Z = reshape(Z, length(Xplot), length(Yplot));
   contourf(Xv, Yv, Z, [0, 1]);
   xlim([xmin, xmax]);
   ylim([ymin, ymax]);
   xlabel('x');
   ylabel('y');
end




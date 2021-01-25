%
% Versin 0.9  (HS 06/03/2020)
%
% template script for task2_plot_regions_hNN_AB.m
function task2_plot_regions_hNN_AB(xmin,xmax,ymin,ymax)
   Xplot = linspace(xmin, xmax, 1000);
   Yplot = linspace(ymin, ymax, 1000);
   [Xv,Yv] = meshgrid(Xplot, Yplot);
   grid = [Xv(:), Yv(:)];
   Z = task2_hNN_AB(grid);
   contourf(Xplot(:), Yplot(:), reshape(Z,length(Xplot), length(Yplot)));
   xlim([xmin, xmax]);
   ylim([ymin, ymax]);
   xlabel('x');
   ylabel('y');

end


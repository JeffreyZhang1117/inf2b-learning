%
% Versin 0.9  (HS 06/03/2020)
%
% template script for task2_plot_regions_sNN_AB
function task2_plot_regions_sNN_AB(xmin,xmax,ymin,ymax)
   Xplot = linspace(xmin, xmax, 1000);
   Yplot = linspace(ymin, ymax, 1000);
   [Xv,Yv] = meshgrid(Xplot, Yplot);
   grid = [Xv(:), Yv(:)];
   Z = task2_sNN_AB(grid);
   Z = reshape(Z,length(Xplot), length(Yplot));
   contourf(Xv, Yv, Z,[1,0]);
   xlim([xmin, xmax]);
   ylim([ymin, ymax]);
   xlabel('x');
   ylabel('y');

end

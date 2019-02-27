%% sedi3D

% This MATLAB script plots sedigraph data in 3D. It basically implements
% plotting of a % 'meshgrid' but with logarithmic x-axis. The script 
% depends on function  'vectorblock' to create z-matrix. The scipt can 
% handle irregularily spaced data by using built-in MATLAB interpolation.
% Created 2009-04-10 by Ola Fredin and Lena Rubensdotter; ola.fredin@ngu.no

%% 

hold off
echo off

%% split data into vectors

gs = data(2:end,1); 
depth = data(1,2:end)';
Z2 = data(2:end,2:end)';
clear data;

%% call function colsub to deconvolute cumulative data

Z = colsub(Z2);
clear Z2;

%% clip peaks to get better looking graphs

%ind = find(Z > 4.2);
%Z(ind) = 4.2;

%% Create X and Y matrices containing data

[X,Y] = meshgrid(gs,depth); 

%% Calculate statistics

zmean = find(mean(Z,2));
zmax = max(Z,2);
zmin = min(Z);
zmedian = median(Z);
zstd = std(Z);   

%% Plot it

figure(1) %Plot it narrow!
caxis([0 100])
contourf(X,Y,Z,20);
colormap(jet)
set(gca,'YDir','Reverse') 
set(gca, 'XScale', 'log')
set(gca,'TickDir','out') 
set(gca,'XMinorTick','on') 
set(gca,'YMinorTick','on')
set(gca,'PlotBoxAspectRatio', [0.2 1 1]) % Set axis aspect
xlabel('Grain-size')
ylabel('Depth')
colorbar

figure(2) %Plot it wide!
caxis([0 100])
% subplot(2,2,1)
% plot(xx,yi,'.k')
% set(gca,'YDir','Reverse')
% set(gca,'YMinorTick','on')
% set(gca,'TickDir','out')
% set(gca,'PlotBoxAspectRatio', [0.1 1 1])
% subplot(2,2,2)
contourf(X,Y,Z,20);
colormap(jet)
set(gca,'YDir','Reverse') 
set(gca,'XScale', 'log')
set(gca,'TickDir','out') 
set(gca,'XMinorTick','on') 
set(gca,'YMinorTick','on')
set(gca,'PlotBoxAspectRatio', [1 2 1]) % Set axis aspect
%zlim([0 3.5])
xlabel('Grain-size')
ylabel('Depth')
colorbar
hold on
%plot(xx,depth_i,'.y')
set(gca,'YDir','Reverse')
hold off

figure(3) %Plot it 3D!
surf(X,Y,Z)
colormap(jet)
set(gca,'YDir','Reverse') 
set(gca, 'XScale', 'log')
set(gca,'TickDir','out') 
set(gca,'XMinorTick','on') 
set(gca,'YMinorTick','on')
set(gca,'PlotBoxAspectRatio', [0.5 1 0.5]) 
xlabel('Grain-size')
ylabel('Depth')
zlabel('% of mass')
colorbar        
hold on
%plot(xx,depth_i,'.y')
set(gca,'YDir','Reverse')
hold off



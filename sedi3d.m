%% sedi3D

% This MATLAB script plots sedigraph data in 3D. It basically implements
% plotting of a % 'meshgrid' but with logarithmic x-axis. The script 
% depends on function  'vectorblock' to create z-matrix. The scipt can 
% handle irregularily spaced data by using built-in MATLAB interpolation.
% Created 2009-04-10 by Ola Fredin and Lena Rubensdotter; ola.fredin@ngu.no

%% 

hold off
echo off

filename = 'GC1_GrainSize.csv'
datatable = readtable(filename);

data = table2array(datatable);
%NB-turned it into an array and got rid of all non numerical values
%% split data into vectors
% these are just the size of the data grid, they don't hold all the data
gs = data(1,2:end); 
depth = data(2:end,1).';
Z2 = data(2:end,2:end);
%clear data; commented out by NB. I don't trust it. why clear data?

%% call function colsub to deconvolute cumulative data

Z = colsub(Z2);
clear Z2;

%% clip peaks to get better looking graphs

%ind = find(Z > 4.2);
%Z(ind) = 4.2;

%% Create X and Y matrices containing data

[X,Y] = meshgrid(gs,depth); 

%% Calculate statistics

%zmean = find(mean(Z,2));
%zmax = max(Z,2);
%zmin = min(Z);
%zmedian = median(Z);
%zstd = std(Z);   
%all commented out by NB. Dont care about these numbers
%% Plot it
% NB- commented it all out bc I think it looks bad
% figure(1) %Plot it narrow!
% caxis([0 100])
% contourf(X,Y,Z,20);
% colormap(jet)
% set(gca,'YDir','Reverse') 
% set(gca, 'XScale', 'log')
% set(gca,'TickDir','out') 
% set(gca,'XMinorTick','on') 
% set(gca,'YMinorTick','on')
% set(gca,'PlotBoxAspectRatio', [0.2 1 1]) % Set axis aspect
% xlabel('Grain-size')
% ylabel('Depth')
% colorbar

figure(2) %Plot it wide!
caxis([0 100])
contourf(X,Y,Z,20);
%colormap(jet)
set(gca,'YDir','Reverse') 
set(gca,'XScale', 'log')
set(gca,'TickDir','out') 
set(gca,'XMinorTick','on') 
set(gca,'YMinorTick','on')
set(gca,'PlotBoxAspectRatio', [1 2 1]) % Set axis aspect
xlabel('Grain-size')
ylabel('Depth')
colorbar
hold on
%plot(xx,depth_i,'.y')
%NB added next two lines bc it was on Katrin's notes
set(gca,'XDir','Reverse') 
axis([1,400,23,37])
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




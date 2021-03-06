%% sedi3D

% This MATLAB script plots sedigraph data in 3D. It basically implements
% plotting of a % 'meshgrid' but with logarithmic x-axis. The script 
% depends on function  'vectorblock' to create z-matrix. The scipt can 
% handle irregularily spaced data by using built-in MATLAB interpolation.
% Created 2009-04-10 by Ola Fredin and Lena Rubensdotter; ola.fredin@ngu.no

%Authors: Nolen Belle Bryant 
%Date: Feb 28th, 2019
%% 

%hold off
%echo off

filenameGC1 = 'GC1_GrainSize_Re.csv'
datatableGC1 = readtable(filenameGC1);

filenameGC1_E = 'GC1_GrainSize_Even.csv'
datatableGC1_E = readtable(filenameGC1_E);

filenameGC3 = 'GC3_GrainSize_Re.csv'
datatableGC3 = readtable(filenameGC3);

dataGC1 = table2array(datatableGC1(1:24,:));
dataGC3 = table2array(datatableGC3(1:27,:));
dataGC1_E = table2array(datatableGC1_E(1:20,:));
%NB-turned it into an array and got rid of all non numerical values
%% split data into vectors
% these are just the size of the data grid, they don't hold all the data
gs1 = dataGC1(1,2:end); 
depth1 = dataGC1(2:end,1).';
Z21 = dataGC1(2:end,2:end);

gs3 = dataGC3(1,2:end); 
depth3 = dataGC3(2:end,1).';
Z23 = dataGC3(2:end,2:end);
%clear data; commented out by NB. I don't trust it. why clear data?

%% call function colsub to deconvolute cumulative data
%Okay! This is what was giving us negative values.
%I'm not sure what it does so I took it out and it still runs fine which 
%is cool -NBB
Z1 = colsub(Z21);
%clear Z21;

Z3 = colsub(Z23);
%clear Z23;

%% clip peaks to get better looking graphs

%ind = find(Z > 4.2);
%Z(ind) = 4.2;

%% Create X and Y matrices containing data

[X,Y] = meshgrid(gs1,depth1); 

[A,B] = meshgrid(gs1,depth3);

%% Calculate statistics

%zmean = find(mean(Z,2));
%zmax = max(Z,2);
%zmin = min(Z);
%zmedian = median(Z);
%zstd = std(Z);   
%all commented out by NB. Dont care about these numbers

%% GC1 Plots

figure(2) %Plot it wide!
caxis([0 100])
contourf(X,Y,Z21,20);
%colormap(jet)
set(gca,'YDir','Reverse') 
set(gca,'XScale', 'log')
set(gca,'TickDir','out') 
set(gca,'XMinorTick','on') 
set(gca,'YMinorTick','on')
set(gca,'PlotBoxAspectRatio', [1 2 1]) % Set axis aspect
xlabel('Grain-size')
xticks([0 10^1 10^2 10^3])
xticklabels({'','','', ''})
ylabel('Depth')
colorbar
hold on
%plot(xx,depth_i,'.y')
%NB added next two lines bc it was on Katrin's notes
set(gca,'XDir','Reverse') 
axis([1,400,23,37])
hold off

figure(3) %Plot it 3D!
surf(X,Y,Z21)
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

%% GC3 Plots 
figure(4) %Plot it wide!
caxis([0 100])
contourf(A,B,Z23,20);
%colormap(jet)
set(gca,'YDir','Reverse') 
set(gca,'XScale', 'log')
set(gca,'TickDir','out') 
set(gca,'XMinorTick','on') 
set(gca,'YMinorTick','on')
set(gca,'PlotBoxAspectRatio', [1 2 1]) % Set axis aspect
xlabel('Grain-size')
xticks([0 10^1 10^2 10^3])
%xticklabels({'','','', ''})
ylabel('Depth')
zlabel('% Volume')
colorbar
hold on
%plot(xx,depth_i,'.y')
%NB added next two lines bc it was on Katrin's notes
set(gca,'XDir','Reverse') 
axis([1,400,23,37])
hold off

figure(5) %Plot it 3D!
surf(A,B,Z23)
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


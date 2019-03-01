%% Density figures
%Author: Nolen Belle Bryant
%Data: March 1, 2019
%Generating density and magnetic suseptability plots for GC1 and GC3

%% All things GC1
% the evens
filename = 'GC1_DensityEven.csv';
data = readtable(filename);

wetDensityEven1 = table2array(data(:,1));
wetDensityEven1(:,2) = table2array(data(:,5));

dryDensityEven1 = table2array(data(:,1));
dryDensityEven1(:,2) = table2array(data(:,7));

% the odds
filename = 'GC1_DensityOdd.csv';
data = readtable(filename);

wetDensityOdd1 = table2array(data(:,1));
wetDensityOdd1(:,2) = table2array(data(:,5));

dryDensityOdd1 = table2array(data(:,1));
dryDensityOdd1(:,2) = table2array(data(:,8));

% there is no combined because of the doubt in the evens
% Magnetic Suseptability
filename = 'GC1_MS.csv';
data = readtable(filename);

magSus1 = table2array(data(1:48,:));

%% All things GC3
% the evens
filename = 'GC3_DensityEven.csv';
data = readtable(filename);

wetDensityEven3 = table2array(data(:,1));
wetDensityEven3(:,2) = table2array(data(:,2));

dryDensityEven3 = table2array(data(:,1));
dryDensityEven3(:,2) = table2array(data(:,3));

%% the odds
filename = 'GC3_DensityOdd.csv';
data = readtable(filename);

wetDensityOdd3 = table2array(data(:,1));
wetDensityOdd3(:,2) = table2array(data(:,9));

dryDensityOdd3 = table2array(data(:,1));
dryDensityOdd3(:,2) = table2array(data(:,10));

%% combined 
filename = 'GC3_DensityCombined.csv';
data = readtable(filename);

wetComboDensity3 = table2array(data(:,1));
wetComboDensity3(:,2) = table2array(data(:,2));

dryComboDensity3 = table2array(data(:,1));
dryComboDensity3(:,2) = table2array(data(:,3));

%% Magnetic Suseptability
filename = 'GC3_MS.csv';
data = readtable(filename);

magSus3 = table2array(data(:,:));
%% Plots

%GC1 wet and dry odds
figure(1)
hold on
plot(X, Y, 'Color',[0 0.8 1] , 'Linewidth', 5)
plot(X, Y, 'Color',[0 0.8 1] , 'Linewidth', 5)
hold off






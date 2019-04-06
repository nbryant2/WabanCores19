%% Density figures
%Author: Nolen Belle Bryant
%Data: March 1, 2019
%Generating density and magnetic suseptability plots for GC1 and GC3n

%% All things GC1
% the  evens
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

%The mean and median
filename = 'GC1_GrainAverages_Re.csv';
data = readtable(filename);

meanMedian1 = table2array(data);
%% All things GC3
% the evens
filename = 'GC3_DensityEven.csv';
data = readtable(filename);

wetDensityEven3 = table2array(data(:,1));
wetDensityEven3(:,2) = table2array(data(:,2));

dryDensityEven3 = table2array(data(:,1));
dryDensityEven3(:,2) = table2array(data(:,3));

% the odds
filename = 'GC3_DensityOdd.csv';
data = readtable(filename);

wetDensityOdd3 = table2array(data(:,1));
wetDensityOdd3(:,2) = table2array(data(:,9));

dryDensityOdd3 = table2array(data(:,1));
dryDensityOdd3(:,2) = table2array(data(:,10));

% Mean and Median Grain Sizes
filename = 'GC3_GrainAverages_Re.csv';
data = readtable(filename);

meanMedian3 = table2array(data);
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
plot(wetDensityOdd1(:,2), wetDensityOdd1(:,1), 'Linewidth', 5) %wet
plot(dryDensityOdd1(:,2), dryDensityOdd1(:,1) , 'Linewidth', 5) %dry
set(gca, 'YDir','reverse')
title('WAB18GC1 Density @ Odd Sample Intervals', 'FontSize', 20)
legend('Wet Density', 'Dry Density')
ylabel('Depth (cm)')
xlabel('Density (g/cm^3)')
hold off

%GC3 wet and dry odds
figure(2)
hold on
plot(wetDensityOdd3(:,2), wetDensityOdd3(:,1), 'Linewidth', 5) %wet
plot(dryDensityOdd3(:,2), dryDensityOdd3(:,1) , 'Linewidth', 5) %dry
set(gca, 'YDir','reverse')
title('WAB18GC3 Density @ Odd Intervals', 'FontSize', 20)
legend('Wet Density', 'Dry Density')
ylabel('Depth (cm)')
xlabel('Density (g/cm^3)')
hold off

%GC3 wet and dry, odds and evens
figure(3)
hold on
plot(wetDensityOdd3(:,2), wetDensityOdd3(:,1), 'Linewidth', 5) %wet
plot(dryDensityOdd3(:,2), dryDensityOdd3(:,1) , 'Linewidth', 5) %dry
plot(wetDensityEven3(:,2), wetDensityEven3(:,1) , 'Linewidth', 5) %wet
plot(dryDensityEven3(:,2), dryDensityEven3(:,1) , 'Linewidth', 5) %dry
set(gca, 'YDir','reverse')
title('WAB18GC3 Density Separated by odds and evens sample intervals', 'FontSize', 10)
legend('Wet Density @ Odd Intervals', 'Dry Density @ Odd Intervals', 'Wet Density @ Even Intervals', 'Dry Density @ Even Intervals')
ylabel('Depth (cm)')
xlabel('Density (g/cm^3)')
hold off

%GC3 all intervals combined
figure(4)
hold on 
plot(wetComboDensity3(:,2), wetComboDensity3(:,1),'Linewidth', 5);
plot(dryComboDensity3(:,2), dryComboDensity3(:,1),'Linewidth', 5);
set(gca, 'YDir','reverse')
title('WAB18GC3 Density ', 'FontSize', 10)
legend('Wet Density', 'Dry Density')
ylabel('Depth (cm)')
xlabel('Density (g/cm^3)')
hold off

%Dry Density for GC1 and GC3 odds
figure(5)
hold on 
plot(dryDensityOdd1(:,2), dryDensityOdd1(:,1),'Linewidth', 5);
plot(dryDensityOdd3(:,2), dryDensityOdd3(:,1),'Linewidth', 5);
set(gca, 'YDir','reverse')
title('Dry Density @ odd sample intervals', 'FontSize', 10)
legend('WAB18GC1', 'WAB18GC3')
ylabel('Depth (cm)')
xlabel('Density (g/cm^3)')
hold off

%Dry Density for GC1 odd and GC3 combo
figure(6)
hold on 
plot(dryDensityOdd1(:,2), dryDensityOdd1(:,1),'Linewidth', 5);
plot(dryComboDensity3(:,2), dryComboDensity3(:,1),'Linewidth', 5);
set(gca, 'YDir','reverse')
title('Dry Density', 'FontSize', 10)
legend('WAB18GC1 odd samples', 'WAB18GC3 all samples ')
ylabel('Depth (cm)')
xlabel('Density (g/cm^3)')
hold off

%Wet Density for GC1 and GC3 odds
figure(7)
hold on 
plot(wetDensityOdd1(:,2), wetDensityOdd1(:,1),'Linewidth', 5);
plot(wetDensityOdd3(:,2), wetDensityOdd3(:,1),'Linewidth', 5);
set(gca, 'YDir','reverse')
title('Wet Density @ odd sample intervals', 'FontSize', 10)
legend('WAB18GC1', 'WAB18GC3')
ylabel('Depth (cm)')
xlabel('Density (g/cm^3)')
hold off

%Wet Density for GC1 odd and GC3 combo
figure(8)
hold on 
plot(wetDensityOdd1(:,2), wetDensityOdd1(:,1),'Linewidth', 5);
plot(wetComboDensity3(:,2), wetComboDensity3(:,1),'Linewidth', 5);
set(gca, 'YDir','reverse')
title('Wet Density', 'FontSize', 10)
legend('WAB18GC1 odd samples', 'WAB18GC3 all samples ')
ylabel('Depth (cm)')
xlabel('Density (g/cm^3)')
hold off

%% Mag Sus GC1
figure (10)
hold on
plot(magSus1(:,2), magSus1(:,1),'Linewidth', 5);
set(gca, 'YDir','reverse')
title('Magnetic Suseptability of WAB18GC1', 'FontSize', 10)
ylabel('Depth (cm)')
xlabel('Magnetic Suseptability (?)')
hold off

%Mag Sus GC1
figure (11)
hold on
plot(magSus3(:,2), magSus3(:,1),'Linewidth', 5);
set(gca, 'YDir','reverse')
title('Magnetic Suseptability of WAB18GC3', 'FontSize', 10)
ylabel('Depth (cm)')
xlabel('Magnetic Suseptability (?)')
hold off

%Mag Sus GC1 and GC3
figure (12)
hold on
plot(magSus1(:,2), magSus1(:,1),'Linewidth', 5);
plot(magSus3(:,2), magSus3(:,1),'Linewidth', 5);
set(gca, 'YDir','reverse')
title('Magnetic Suseptability', 'FontSize', 10)
legend('WAB18GC1','WAB18GC3')
ylabel('Depth (cm)')
xlabel('Magnetic Suseptability (?)')
hold off

%% Mean and Median Grain Sizes GC1
figure (13)
hold on
plot(meanMedian1(:,2), meanMedian1(:,1),'Linewidth', 5);
plot(meanMedian1(:,3), meanMedian1(:,1),'Linewidth', 5);
set(gca, 'YDir','reverse')
title('Measures of Grain Size in WAB18GC1', 'FontSize', 10)
legend('Mean','Median')
ylabel('Depth (cm)')
xlabel('Grain Size (\mum)')
hold off

%Mean and Median Grain Sizes GC3
figure (14)
hold on
plot(meanMedian3(:,2), meanMedian3(:,1),'Linewidth', 5);
plot(meanMedian3(:,3), meanMedian3(:,1),'Linewidth', 5);
set(gca, 'YDir','reverse')
title('Measures of Grain Size in WAB18GC3', 'FontSize', 10)
legend('Mean','Median')
ylabel('Depth (cm)')
xlabel('Grain Size (\mum)')
hold off

%% Grain Size Example for the Poster

filename = 'PosterGrainSize.csv';
data = readtable(filename);

size = table2array(data(:,2:end));
%%
figure (15)
hold on
plot(size(1,6:85), size(2,6:85)','Linewidth', 5);
plot(size(1,6:85), size(3,6:85)','Linewidth', 5);
set(gca, 'XDir','reverse')
set(gca, 'XScale', 'log')
legend('WAB18GC1 20cm','WAB18GC3 23cm')
ylabel('Volume Percent [%]')
xlabel('Grain Size (\mum)')
xlim([0 1091])
hold off



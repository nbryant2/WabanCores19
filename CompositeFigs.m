%% Must run corePlots and sedi3d first

%% Composite Plot For GC1

% Mag Sus 
figure (1)
hold on
%subplot(1,4,1)
plot(magSus1(:,2), magSus1(:,1),'Linewidth', 5);
set(gca, 'YDir','reverse')
title('Magnetic Suseptability of WAB18GC1', 'FontSize', 10)
ylabel('Depth (cm)')
xlabel('Magnetic Suseptability ()')
hold off

%GC1 wet and dry odds
figure(2)
hold on
%subplot(1,4,2)
plot(wetDensityOdd1(:,2), wetDensityOdd1(:,1), 'Linewidth', 5) %wet
plot(dryDensityOdd1(:,2), dryDensityOdd1(:,1) , 'Linewidth', 5) %dry
set(gca, 'YDir','reverse')
title('WAB18GC1 Density @ Odd Sample Intervals', 'FontSize', 20)
legend('Wet Density', 'Dry Density')
ylabel('Depth (cm)')
xlabel('Density (g/cm^3)')
hold off


%Mean and Median Grain Sizes GC1
figure (3)
hold on
%subplot(1,4,3)
plot(meanMedian1(:,2), meanMedian1(:,1),'Linewidth', 5);
plot(meanMedian1(:,3), meanMedian1(:,1),'Linewidth', 5);
set(gca, 'YDir','reverse')
title('Measures of Grain Size in WAB18GC1', 'FontSize', 10)
legend('Mean','Median')
ylabel('Depth (cm)')
xlabel('Grain Size (\mum)')
hold off

figure(4) %Plot it wide!
hold on
%subplot(1,4,4)
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
ylabel('Depth')
colorbar
%plot(xx,depth_i,'.y')
%NB added next two lines bc it was on Katrin's notes
set(gca,'XDir','Reverse') 
axis([1,400,23,37])
hold off

%% Composite Plot for GC3

%Mag Sus
figure (5)
hold on
plot(magSus3(:,2), magSus3(:,1),'Linewidth', 5);
set(gca, 'YDir','reverse')
title('Magnetic Suseptability of WAB18GC3', 'FontSize', 10)
ylabel('Depth (cm)')
xlabel('Magnetic Suseptability (?)')
hold off

%GC3 wet and dry odds
figure(6)
hold on
plot(wetDensityOdd3(:,2), wetDensityOdd3(:,1), 'Linewidth', 5) %wet
plot(dryDensityOdd3(:,2), dryDensityOdd3(:,1) , 'Linewidth', 5) %dry
set(gca, 'YDir','reverse')
title('WAB18GC3 Density @ Odd Intervals', 'FontSize', 20)
legend('Wet Density', 'Dry Density')
ylabel('Depth (cm)')
xlabel('Density (g/cm^3)')
hold off

%Mean and Median Grain Sizes GC3
figure (7)
hold on
plot(meanMedian3(:,2), meanMedian3(:,1),'Linewidth', 5);
plot(meanMedian3(:,3), meanMedian3(:,1),'Linewidth', 5);
set(gca, 'YDir','reverse')
title('Measures of Grain Size in WAB18GC3', 'FontSize', 10)
legend('Mean','Median')
ylabel('Depth (cm)')
xlabel('Grain Size (\mum)')
hold off

figure(8) %Plot it wide!
hold on
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
ylabel('Depth')
zlabel('% Volume')
colorbar
%plot(xx,depth_i,'.y')
%NB added next two lines bc it was on Katrin's notes
set(gca,'XDir','Reverse') 
axis([1,400,23,37])
hold off
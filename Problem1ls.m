%function Problem1ls
clc,clear

load('us_population.mat','HistoricalPopulationDataUS')

t = HistoricalPopulationDataUS(:,1);
e = ones(size(t));
A = [e, t];
b = log(HistoricalPopulationDataUS(:,2));
ls_result = A\b;
plot(t,b,'.','MarkerSize',20)
hold on
plot(t,ls_result(1) + t*ls_result(2),'linewidth',2)

hold off

set(gca,'FontSize',20)
xlabel('Year')
ylabel('log(Population)')
title(sprintf('Semilog Plot, Least Squares k: %1.3f',ls_result(2)))
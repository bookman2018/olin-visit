function Problem1ui


global ax2;
  
  ax1 = axes('Position',[0 0 1 1]);
  set(ax1,'Visible','off')
  ax2 = axes ('position', [0.2, 0.3, 0.7, 0.6]);
plotter(0.02)
axes(ax1)
  text(0.05,.075,'k:','FontSize',16)

hslider = uicontrol (                    ...
         'style', 'slider',                ...
         'Units', 'normalized',            ...
         'Position',[0.1 0.025 0.8 0.1], ...
         'min', 0.01,                         ...
         'max', 0.04,                        ...
         'value', 0.02,                      ...
         'callback', {@plotslide}          ...
       );

end  

function plotslide(h, event)
  k = get (h, 'value');
  plotter(k)
 end

function plotter(k) 
  global ax2
load('us_population.mat','HistoricalPopulationDataUS')

decades = linspace(min(HistoricalPopulationDataUS(:,1)),max(HistoricalPopulationDataUS(:,1)));

plot(ax2,HistoricalPopulationDataUS(:,1),HistoricalPopulationDataUS(:,2)/1e6,'.','MarkerSize',20)
hold on
plot(ax2,decades,3929214*exp(k*(decades-1790))/1e6,'linewidth',2)
hold off
set(gca,'FontSize',20)
xlabel('Year')
ylabel({'Population'; '(in millions of people)'})
title(sprintf('US Population w/ model k=%1.2f',k))
ylim([0,1.2*max(HistoricalPopulationDataUS(:,2)/1e6)])
xlim([min(decades),max(decades)])
end
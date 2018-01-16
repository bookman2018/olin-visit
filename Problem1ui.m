function Problem1ui
clf


global ax2;
ax1 = axes('Position',[0 0 1 1],'Visible','off');
  ax2 = axes ('position', [0.2, 0.3, 0.7, 0.6]);
axes(ax1)
  text(0.05,.075,'k:','FontSize',16)
plotter(0.02)
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
  global ax2;
  
  
load('us_population.mat','HistoricalPopulationDataUS')

decades = linspace(min(HistoricalPopulationDataUS(:,1)),max(HistoricalPopulationDataUS(:,1)));

plot(ax2,HistoricalPopulationDataUS(:,1),HistoricalPopulationDataUS(:,2)/1e6,'.','MarkerSize',20)
hold(ax2,'on');
plot(ax2,decades,3929214*exp(k*(decades-1790))/1e6,'linewidth',2)
hold(ax2,'off');
set(ax2,'FontSize',20)
xlabel(ax2,'Year')
ylabel(ax2,{'Population'; '(in millions of people)'})
title(ax2,sprintf('US Population w/ model k=%1.4f',k))
ylim(ax2,[0,1.2*max(HistoricalPopulationDataUS(:,2)/1e6)])
xlim(ax2,[min(decades),max(decades)])
end
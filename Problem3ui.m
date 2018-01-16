function Problem3ui
  global M; M= 500000000;
  global k; k = 0.02;
  global ax2;
  ax1 = axes('Position',[0 0 1 1]); 
  set(ax1,'Visible','off')
  ax2 = axes ('position', [0.2, 0.4, 0.7, 0.4]);
  plotter()
  axes(ax1)
  text(0.05,.075,'k:','FontSize',16)
  text(0.05,.2,'M:','FontSize',16)
  %% Add ui 'slider' element      
  hslider = uicontrol (                    ...
         'style', 'slider',                ...
         'Units', 'normalized',            ...
         'Position',[0.1 0.025 0.8 0.1], ...
         'min', 0.0001,                         ...
         'max', 0.04,                        ...
         'value', k,                      ...
         'callback', {@slide1}          ...
       );
 hslider2 = uicontrol (                    ...
   'style', 'slider',                ...
   'Units', 'normalized',            ...
   'position', [0.1 0.15 0.8 0.1], ...
   'min', 200000000,                         ...
   'max', 800000000,                        ...
   'value', M,                      ...
   'callback', {@slide2}          ...
       );
end

function plotter()
  global k;
  global M;
  global ax2;
  load('us_population.mat','HistoricalPopulationDataUS')

decades = linspace(min(HistoricalPopulationDataUS(:,1)),max(HistoricalPopulationDataUS(:,1)));

plot(ax2,HistoricalPopulationDataUS(:,1),HistoricalPopulationDataUS(:,2)/1e6,'.','MarkerSize',20)
hold on
plot(ax2,decades,(3929214*M*exp(k*(decades-1790)))./((M-3929214) +3929214*exp(k*(decades-1790)) )/1e6,'linewidth',2)
hold off
set(gca,'FontSize',20)
xlabel('Year')
ylabel({'Population'; '(in millions of people)'})
title({'US Population w/' ;sprintf('k=%1.2f & M = %1.2f (millions)',k,M/1e6)})
ylim([0,1.2*max(HistoricalPopulationDataUS(:,2)/1e6)])
xlim([min(decades),max(decades)])
end

function slide1 (h, event)
  global k;
  k = get (h, 'value');
  plotter()
end

function slide2 (h, event)
  global M;
  M = get (h, 'value');
  plotter()
end
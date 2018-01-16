function Problem4uic
clf
  global M; M= 2;
  global k; k = 0.1;
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
         'min', 0.05,                         ...
         'max', 0.3,                        ...
         'value', k,                      ...
         'callback', {@slide1}          ...
       );
 hslider2 = uicontrol (                    ...
   'style', 'slider',                ...
   'Units', 'normalized',            ...
   'position', [0.1 0.15 0.8 0.1], ...
   'min', 1,                         ...
   'max', 3,                        ...
   'value', M,                      ...
   'callback', {@slide2}          ...
       );
end

function plotter()
  global k;
  global M;
  global ax2;
  load('bacteria.mat','BacteriaData')

hours = linspace(min(BacteriaData(:,1)),max(BacteriaData(:,1)));

plot(ax2,BacteriaData(:,1),BacteriaData(:,2),'.','MarkerSize',20)
hold(ax2,'on')
plot(ax2,hours,0.02*M*exp(k*hours)./(M + 0.02*(-1 + exp(k*hours))) ,'linewidth',2)
hold(ax2,'off')
set(ax2,'FontSize',20)
xlabel(ax2,'Year')
ylabel(ax2,'Population Density')
title(ax2,{'Bacteria Population w/' ;sprintf('k=%1.2f & M = %1.2f',k,M)})
ylim(ax2,[0,1.2*max(BacteriaData(:,2))])
xlim(ax2,[min(hours),max(hours)])
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
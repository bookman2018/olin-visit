function Problem11ui
clf;
f =figure(gcf);
global c;
  global A;
  global x;
  global P0;
  global ax2;
  
  ax1 = axes('Parent',f,'Position',[0 0 1 1],'Visible','off');
  ax2 = axes ('Parent',f,'position', [0.1, 0.3, 0.8, 0.6]);
  axes(ax1)
  text(0.05,.075,'t:','FontSize',16)

c = 10;
A = 20;

x = linspace(0,100,2000);
P0 = @(x) exp(-((x-50)/6).^2);

plot(ax2,x,P0(x),'linewidth',2)
title(ax2,sprintf('t=%1.2f',0),'fontsize',20)
    set(ax2,'fontsize',16)  
    legend(ax2,'P(x,t)')
    xlabel(ax2,'x')
  ylabel(ax2,'P','rot',0)
  
  hslider = uicontrol('Parent',f,                    ...
         'style', 'slider',                ...
         'Units', 'normalized',            ...
         'Position',[0.1 0.025 0.8 0.1], ...
         'min', 0,                         ...
         'max', 1,                        ...
         'value',0,                      ...
         'callback', {@plotter}          ...
       );
  
end

function plotter(h, event)
    global c;
  global A;
  global x;
  global P0;
  global ax2;
    t = get (h, 'value');
    plot(ax2,x,P0(x-A*sin(c*t)),'linewidth',2)
    title(ax2,sprintf('t=%1.2f',t),'fontsize',20)
    set(ax2,'fontsize',16)  
    legend(ax2,'P(x,t)')
    xlabel(ax2,'x')
  ylabel(ax2,'P','rot',0)
  end
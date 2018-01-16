function Problem10ui
clf
global ax2;
  global x;
  global maxY;
  
  ax1 = axes('Position',[0 0 1 1]);
  set(ax1,'Visible','off')
  ax2 = axes ('position', [0.1, 0.3, 0.8, 0.6]);
  axes(ax1)
  text(0.05,.075,'t:','FontSize',16)

c = 50;
P0 = @(x) exp(-((x-25)/6).^2);
x = linspace(0,100,1000)';
h = x(2);


f = @(t,y) -c*(y - circshift(y,1))/h;


  maxY = 1.2*max(P0(x));
  
  plot(ax2,x,P0(x),'linewidth',2)
  title(ax2,sprintf('t=0'),'fontsize',20)
  ylim(ax2,[0,1.2*max(P0(x))])
  set(gca,'fontsize',16)  
  legend(ax2,'P(x,t)')
  
  
  global sol
  sol = ode45(f,[0,1],P0(x));
  
  hslider = uicontrol (                    ...
         'style', 'slider',                ...
         'Units', 'normalized',            ...
         'Position',[0.1 0.025 0.8 0.1], ...
         'min', min(sol.x),                         ...
         'max', max(sol.x),                        ...
         'value', min(sol.x),                      ...
         'callback', {@plotter}          ...
       );
  
end

function plotter(h, event)
    global x
    global ax2
    global sol
    global maxY
    t = get (h, 'value');
    P = interp1(sol.x,sol.y',t);
    plot(ax2,x,P,'linewidth',2)
    title(ax2,sprintf('t=%1.2f',t),'fontsize',20)
    ylim(ax2,[0,maxY])
    set(gca,'fontsize',16)  
    legend(ax2,'P(x,t)')
  end
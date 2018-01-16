function Problem8ui
clf
  global ax2;
  global x;
  global A;
  
  ax1 = axes('Position',[0 0 1 1]);
  set(ax1,'Visible','off')
  ax2 = axes ('position', [0.1, 0.3, 0.8, 0.6]);
  axes(ax1)
  text(0.05,.075,'t:','FontSize',16)
  

  k = 0.05;
  A = @(x) 300 + 100*cos(2*pi*x/50);
  P0 = @(x) 100 + 50*sin(2*pi*x/50);
  x = linspace(0,100,2000)';
  
  f = @(t,y) k*y.*(A(x) - y);
  
  
  plot(ax2,x,P0(x),'linewidth',3);
    hold(ax2,'on')
    plot(ax2,x,A(x),'linewidth',2);
    hold(ax2,'off')
  title(ax2,sprintf('t=0'),'fontsize',20)
  ylim(ax2,[0,500])
  set(ax2,'fontsize',16)  
  legend(ax2,'P(x,t)','A(x)')
  
  
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
    global A
    global sol
    t = get (h, 'value');
    P = interp1(sol.x,sol.y',t);
    plot(ax2,x,P,'linewidth',3);
    hold(ax2,'on')
    plot(ax2,x,A(x),'linewidth',2);
    hold(ax2,'off')
    title(ax2,sprintf('t=%1.2f',t),'fontsize',20)
    ylim(ax2,[0,500])
    set(ax2,'fontsize',16)  
    legend(ax2,'P(x,t)','A(x)')
  end
%function Problem10
  
c = 50;
P0 = @(x) exp(-((x-25)/6).^2);
x = linspace(0,100,1000)';
h = x(2);


f = @(t,y) -c*(y - circshift(y,1))/h;

sol = ode45(f,[0,1],P0(x));

num_times = 50;
ts = linspace(min(sol.x),max(sol.x),num_times);

for kk = 1:num_times
  t = ts(kk);
  P = interp1(sol.x,sol.y',t);
  plot(x,P,'linewidth',2)
  title(sprintf('t=%1.2f',t),'fontsize',20)
  xlabel('x')
  ylabel('P','rot',0)
  ylim([0,1.2*max(P0(x))])
  set(gca,'fontsize',16)  
  legend('P(x,t)')
  pause(0.01)

end


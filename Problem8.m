function Problem8
  

k = 0.05;
A = @(x) 300 + 100*cos(2*pi*x/50);
P0 = @(x) 100 + 50*sin(2*pi*x/50);
x = linspace(0,100,2000)';

f = @(t,y) k*y.*(A(x) - y);

sol = ode45(f,[0,1],P0(x));

num_times = 50;
ts = linspace(min(sol.x),max(sol.x),num_times);

for kk = 1:num_times
  t = ts(kk);
  P = interp1(sol.x,sol.y',t);
  plot(x,P,'linewidth',3)
  hold on
  plot(x,A(x),'linewidth',2)
  hold off
  title(sprintf('t=%1.2f',t),'fontsize',20)
  ylim([0,500])
  set(gca,'fontsize',16)  
  legend('P(x,t)','A(x)')
  pause(0.01)

end
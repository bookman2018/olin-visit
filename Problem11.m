function Problem11
  
c = 10;
A = 20;

x = linspace(0,100,2000);
P0 = @(x) exp(-((x-50)/6).^2);





num_times = 100;
ts = linspace(0,1,num_times);
for kk = 1:num_times
  t = ts(kk);
  plot(x,P0(x-A*sin(c*t)),'linewidth',2)
  title(sprintf('t=%1.2f',t),'fontsize',20)
  ylim([0,1.2*max(P0(x))])
  set(gca,'fontsize',16) 
  legend('P(x,t)')
  pause(0.01)

end


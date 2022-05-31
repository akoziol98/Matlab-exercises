session = [1:1:100].';
th=1000*[1:100].^(-1/4)+ randn(1,100)/5;

subplot(2,1,1)
plot(th, session, 'o')
grid on
grid minor
ylim([0 10])
ylabel('session')
xlabel('performance')
title('performance vs session number')
legend('Performance')

subplot(2,1,2)
histogram(th, 40, 'FaceColor','red')
grid on
ylabel('count')
xlabel('performance')
title('performance in 40 bins')
legend('Performance')
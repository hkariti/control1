%% system parameters
M = 0.5;
m = 0.2;
b = 0.1;
l = 0.3;
I = 0.006;
g= 10;
%% plot output to step input
figure;
hold on;
plot(linear_in.Time, linear_in.Data);
plot(linear_out.Time, linear_out.Data);
plot(nl_out.Time, nl_out.Data);
xlabel('Time [s]');
ylabel('Angle [rad]');
title('Linear and non-linear response to step input');
legend('input', 'linear out (\phi)', 'non-linear out (\theta)');
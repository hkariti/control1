%% q2
alpha = 1;
zeta = 0.5;
G_0 = tf(1, [1, 2*zeta, 1]);
G_d = tf([1/(alpha*zeta), 0], [1, 2*zeta, 1]);
G = G_0 + G_d;
% plot
step(G_0, G_d, G);
legend('G_0', 'G_d', 'G');
t = xlabel('Normalized Time (t*\omega_n)');
t.String = 'Normalized Time (t*\omega_n)';
%% q3
zeta = 0.5;
G_pole_alpha = @(alpha)tf([1/(alpha*zeta),1], [1, 2*zeta, 1]);
step(G_pole_alpha(1), G_pole_alpha(2), G_pole_alpha(4), G_pole_alpha(100));
legend('\alpha=1', '\alpha=2', '\alpha=4', '\alpha=100');
title('Step response for different \alpha values');
t = xlabel('Normalized Time (t*\omega_n)');
t.String = 'Normalized Time (t*\omega_n)';
%% q4
G_pole_alpha_zeta = @(alpha, zeta)tf([1/(alpha*zeta),1], [1, 2*zeta, 1]);
figure;
rt_array = zeros(3, 100);
zetas = [0.3 0.5 0.7];
for ind = 1:length(zetas)
    zeta = zetas(ind);
    for alpha = 1:100
        S = stepinfo(G_pole_alpha_zeta(alpha, zeta));
        rt_array(ind, alpha) = S.Overshoot;
    end
end
plot(1:100, rt_array);
title('Overshoot as a function of \alpha for different \zeta values');
legend('\zeta = 0.3', '\zeta = 0.5', '\zeta = 0.7');
ylabel('Overshoot');
xlabel('\alpha value');
%% q5
alpha = -1;
zeta = 0.5;
G_0 = tf(1, [1, 2*zeta, 1]);
G_d = tf([1/(alpha*zeta), 0], [1, 2*zeta, 1]);
G = G_0 + G_d;
% plot
step(G_0, G_d, G);
legend('G_0', 'G_d', 'G');
t = xlabel('Normalized Time (t*\omega_n)');
t.String = 'Normalized Time (t*\omega_n)';
%% q6
zeta = 0.5;
G_pole_alpha = @(alpha)tf(1, [1/(alpha*zeta), 1])*tf(1, [1, 2*zeta, 1]);
step(G_pole_alpha(1), G_pole_alpha(2), G_pole_alpha(5), G_pole_alpha(100));
legend('\alpha=1', '\alpha=2', '\alpha=5', '\alpha=100');
title('Step response for different \alpha values');
t = xlabel('Normalized Time (t*\omega_n)');
t.String = 'Normalized Time (t*\omega_n)';
%% q7
G_pole_alpha_zeta = @(alpha, zeta)tf(1, [1/(alpha*zeta), 1])*tf(1, [1, 2*zeta, 1]);
figure;
rt_array = zeros(3, 100);
zetas = [0.3 0.5 0.7];
for ind = 1:length(zetas)
    zeta = zetas(ind);
    for alpha = 1:100
        S = stepinfo(G_pole_alpha_zeta(alpha, zeta));
        rt_array(ind, alpha) = S.RiseTime;
    end
end
plot(1:100, rt_array);
title('Rusing time as a function of \alpha for different \zeta values');
legend('\zeta = 0.3', '\zeta = 0.5', '\zeta = 0.7');
ylabel('Rising time (t*\omega_n)');
xlabel('\alpha value');
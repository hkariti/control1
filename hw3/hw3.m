load('../CartParams.mat')
% Transfer function from url in hw2 with added K amplification
K = 1;
g = 9.8;
q = (M + m)*(I + m*l^2)-(m*l)^2;
G = tf([K*m*l/q,0], [1, b*(I+m*l^2)/q, -(M+m)*m*g*l/q, -b*m*g*l/q]);

% Closed loop system
T = feedback(G, 1);
bode(T);
nyquist(T);
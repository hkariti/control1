%% Constants
J = 3.2284e-6;
b = 3.5077e-6;
Ke = 0.0274;
Kt = 0.0274;
R = 4;
L = 2.75e-6;

%% State-Space matrices
A = [ 0 1 0 ; 0 -b/J Kt/J ; 0 -Ke/L -R/L ];
B = [ 0; 0; 1/L ];
C = [ 1 0 0 ];
D = 0;

state_space = ss(A, B, C, D);
[tf_nom, tf_denom] = ss2tf(A, B, C, D);
step(state_space, 0.05)
ylabel("Engine Angle \theta (rad)")
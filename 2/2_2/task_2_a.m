%% State space
A = [-0.322 0.053 0.028 -1.12 0.002;
    0 0 1 -0.001 0;
    -10.6 0 -2.87 0.46 -0.65;
    6.87 0 -0.04 -0.32 -0.02;
    0 0 0 0 -7.5];

B = [0; 0; 0; 0; 7.5];

C = [1 0 0 0 0;
    0 1 0 0 0;
    0 0 1 0 0;
    0 0 0 1 0];

D = 0;

sys = ss(A,B,C,D);

%% System constants
V_a = 580/3.6;
g = 9.81;

%% Calculate control gains
a_2 = -0.65;
a_1 = 2.87;

u_max = 30; %[deg]
e_max = 15; %[deg]

omega_phi = sqrt(abs(a_2)*(u_max/e_max));
seta_phi = 0.707;

k_p_phi = -(u_max/e_max);
k_d_phi = (2*seta_phi*omega_phi - a_1)/a_2;
k_i_phi = 0.5; %By observing root-locus-curves

omega_chi = omega_phi/10;
seta_chi = 0.707;

k_p_chi = 2*seta_chi*omega_chi*V_a/g;
k_i_chi = (omega_chi^2)*V_a/g;

%% Root locus analysis
h = tf([-a_2], [1 (a_1 + a_2*k_d_phi), a_2*k_p_phi, 0]);
rlocus(h);
%controlSystemDesigner('rlocus', h)

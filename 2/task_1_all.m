%% Some constants
V_a = 580;
beta = 0;

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

%% Calculate damping ratio for dutch-roll mode precisely
sys = ss(A, B, C, D)
damp(sys)




%% Calculates different modes
N_r     = A(4,4); 
L_v     = A(3,1)/(V_a*cos(beta));
L_r     = A(3,4);
N_v     = A(4,1)/(V_a*cos(beta));
L_p     = A(3,3);
Y_v     = A(1,1);
Y_r     = A(1,4)*V_a;

lam_spiral      = (N_r*L_v - N_v*L_r)/L_v
lam_dutch_pos   = (Y_v + N_r)/2 + sqrt(((Y_v + N_r)/2)^2 - (Y_v*N_r - N_v*Y_r))
lam_dutch_neg   = (Y_v + N_r)/2 - sqrt(((Y_v + N_r)/2)^2 - (Y_v*N_r - N_v*Y_r))
lam_roll        = L_p

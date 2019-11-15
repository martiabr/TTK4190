%% Description
%Solution to task 1_3, design a control law

%% Constants

w_n = 0.1;
zeta = 0.8;

k_p = w_n^2*T/K;
k_d = (2*zeta*sqrt(K*k_p*T) - 1)/K;
k_i = 1/T;



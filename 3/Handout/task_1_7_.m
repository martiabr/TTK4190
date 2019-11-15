%% Description
%%Solution to task 1_7: Design a PI surge controller

%% Constants
%Controller constants to determine propeller input n given by
%n = -k_up*u - k_ui*

n_max = 85*2*pi/60;
e_max = 0.9;
k_up = n_max/e_max;
k_ui = 60/T_u;
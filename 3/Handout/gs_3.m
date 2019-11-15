function [psi_d, u_d] = gs_3(t, psi, x, y, u, v, WP)
%gs Target tracking using LOS
%   Detailed explanation goes here
% TODO: Make target, add speed control


%% Constants
R = 1200; %Two ship-lengths
alpha = atan2(WP(2,2) - WP(2,1), WP(1,2) - WP(1,1));
Delta = 600;

%% Implement target
U_t = 3;
x_t = U_t*cos(alpha)*t + WP(1,2);
y_t = U_t*sin(alpha)*t + WP(2,2);

s_d = 1000;

p_thilde = [x y]' - [x_t y_t]';
s = cos(alpha)*p_thilde(1) + sin(alpha)*p_thilde(2) + s_d;
e = -sin(alpha)*p_thilde(1) + cos(alpha)*p_thilde(2);

%% Steering law for course
chi_r = atan(-e/Delta);
chi_d = alpha + chi_r;
% if chi_d < 0
%     chi_d = chi_d + 2*pi;
% end

%% Sterring law for speed

d = 2000;
kappa = 5;
U_d = U_t - kappa*s/sqrt(s^2 + d^2);
u_d = sqrt(U_d^2 - v^2);

%% Compensate for crab angle
beta_c = atan2(v, u);
psi_d = chi_d - beta_c;

end






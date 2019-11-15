function [chi_d, U_d] = gs(psi, x, y, u, v, WP)
%gs Lookahead steering law
%   Detailed explanation goes here


%% Constants
R = 1200; %Two ship-lengths

%% Initialize k
persistent k;
if isempty(k)
    k = 1;
end

%% Get alpha and cross-track error and delta
alpha = atan2(WP(2,k+1) - WP(2,k), WP(1,k+1) - WP(1,k));
e = -(x-WP(1,k))*sin(alpha) + (y-WP(2,k))*cos(alpha);
Delta = sqrt(R^2 - e^2);

%% Steering law
chi_r = atan(-e/Delta);
chi_d = alpha + chi_r;
if chi_d < 0
    chi_d = chi_d + 2*pi;
end
U_d = 5; % (?)

%% Check if next waypoint is reached
if ((WP(1, k+1) - x)^2 + (WP(2, k+1) - y)^2 <= R^2) && (k < 5)
    k = k+1;
end 
end


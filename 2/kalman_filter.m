function [x] = kalman_filter(y, delta_a, P_0, x_0, R, Q)
%Discrete Kalman filter
%   Detailed explanation goes here

persistent P;
persistent x_bar;
h = 1/100;

A = [-0.322 0.052 0.028 -1.12;
    0 0 1 -0.001;
    -10.6 0 -2.87 0.46;
    6.87 0 -0.04 -0.32];

B = [0.002; 0; -0.65; 0.02];
H =[0 0 1 0; 0 0 0 1];
E = eye(4);

if isempty(P)
    P = P_0;
    x_bar = x_0;
end

%Kalman gain
K = P*H'/(H*P*H' + R);

%Corrector
P = (eye(4) - K*H)*P*(eye(4) - K*H)' + K*R*K';
x = x_bar + K*(y - H*x_bar);

%Predictor
phi = expm(A*h);
delta = A\(phi-eye(4))*B;
gamma = A\(phi-eye(4))*E;

x_bar = phi*x + delta*delta_a;
P = phi*P*phi' + gamma*Q*gamma';

end


% M-script for numerical integration of the attitude dynamics of a rigid 
% body represented by unit quaternions. The MSS m-files must be on your
% Matlab path in order to run the script.
%
% System:                      .
%                              q = T(q)w
%                              .
%                            I w - S(Iw)w = tau
% Control law:
%                            tau = constant
% 
% Definitions:             
%                            I = inertia matrix (3x3)
%                            S(w) = skew-symmetric matrix (3x3)
%                            T(q) = transformation matrix (4x3)
%                            tau = control input (3x1)
%                            w = angular velocity vector (3x1)
%                            q = unit quaternion vector (4x1)
%
% Author:                   2018-08-15 Thor I. Fossen and Håkon H. Helgesen

%% USER INPUTS
h = 0.1;                     % sample time (s)
N  = 3000;                    % number of samples. Should be adjusted

% model parameters
m = 180;
r = 2;
I = m*r^2*eye(3);            % inertia matrix
I_inv = inv(I);
k_p = 20;
k_d = 400;

% constants
deg2rad = pi/180;   
rad2deg = 180/pi;

phi = -5*deg2rad;            % initial Euler angles
theta = 10*deg2rad;
psi = -20*deg2rad;

q = euler2q(phi,theta,psi);   % transform initial Euler angles to q

w = [0 0 0]';                 % initial angular rates

table = zeros(N+1,17);        % memory allocation

%% FOR-END LOOP
for i = 1:N+1
   t = (i-1)*h;                  % time
   phi_d = 0;
   theta_d = deg2rad*15*cos(0.1*t);
   psi_d = deg2rad*10*sin(0.05*t);
   
   q_d = euler2q(phi_d, theta_d, psi_d);
   q_d_conj = [q_d(1); -q_d(2); -q_d(3); -q_d(4)];
   
   T_inv = [1 0 -sin(theta_d);
            0 cos(phi_d) cos(theta_d)*sin(phi_d);
            0 -sin(phi_d) cos(theta_d)*cos(phi_d)];
   
   w_d = T_inv * deg2rad*[ 0; -1.5*sin(0.1*t); 0.5*cos(0.05*t)];
   
   q_thilde = quatprod(q_d_conj, q);
   w_thilde = w - w_d;
   
   tau = -k_d*eye(3)*w_thilde-k_p*eye(3)*q_thilde(2:4);            % control law
    
   [phi_err, theta_err, psi_err] = q2euler(q_thilde);
   [phi,theta,psi] = q2euler(q); % transform q to Euler angles
   [J,J1,J2] = quatern(q);       % kinematic transformation matrices
   
   q_dot = J2*w;                        % quaternion kinematics
   w_dot = I_inv*(Smtrx(I*w)*w + tau);  % rigid-body kinetics
   
   table(i,:) = [t q' phi theta psi w' tau' phi_err' theta_err' psi_err'];  % store data in table
   
   q = q + h*q_dot;	             % Euler integration
   w = w + h*w_dot;
   
   q  = q/norm(q);               % unit quaternion normalization
end 

%% PLOT FIGURES
t       = table(:,1);  
q       = table(:,2:5); 
phi     = rad2deg*table(:,6);
theta   = rad2deg*table(:,7);
psi     = rad2deg*table(:,8);
w       = rad2deg*table(:,9:11);  
tau     = table(:,12:14);
phi_err     = rad2deg*table(:,15);
theta_err   = rad2deg*table(:,16);
psi_err     = rad2deg*table(:,17);

figure (1); clf;
hold on;
plot(t, phi, 'b');
plot(t, theta, 'r');
plot(t, psi, 'g');
hold off;
grid on;
legend('\phi', '\theta', '\psi');
title('Euler angles');
xlabel('time [s]'); 
ylabel('angle [deg]');

figure (2); clf;
hold on;
plot(t, w(:,1), 'b');
plot(t, w(:,2), 'r');
plot(t, w(:,3), 'g');
hold off;
grid on;
legend('x', 'y', 'z');
title('Angular velocities');
xlabel('time [s]'); 
ylabel('angular rate [deg/s]');

figure (3); clf;
hold on;
plot(t, tau(:,1), 'b');
plot(t, tau(:,2), 'r');
plot(t, tau(:,3), 'g');
hold off;
grid on;
legend('x', 'y', 'z');
title('Control input');
xlabel('time [s]'); 
ylabel('input [Nm]');

figure (4); clf;
hold on;
plot(t, phi_err, 'b');
plot(t, theta_err, 'r');
plot(t, psi_err, 'g');
hold off;
grid on;
legend('\phi', '\theta', '\psi');
title('Euler angles error');
xlabel('time [s]'); 
ylabel('angle [deg]');
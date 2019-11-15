%% Description
%%Solution to task 2_7: Target tracking

%% Tidy up
close all;

%% Plot
alpha = atan2(WP(2,2) - WP(2,1), WP(1,2) - WP(1,1)); 
U_t = 3;
x_t = U_t*cos(alpha)*t + WP(1,2);
y_t = U_t*sin(alpha)*t + WP(2,2);

s_d = 1000;

p_thilde = p' - [x_t y_t]';
s = cos(alpha)*p_thilde(1,:) + sin(alpha)*p_thilde(2,:);
e = -sin(alpha)*p_thilde(1,:) + cos(alpha)*p_thilde(2,:);

figure(1)
hold on
grid on

hold off

%Plot heading
task_2_7_errors = figure(1);
hold on
grid on
plot(t, s)
plot(t, e)
title('Cross-track and along-track error to target')
xlabel('Time [s]')
ylabel('Distance [m]')
hold off
hgexport(task_2_7_error,'task_2_7_error.eps',myStyle,'Format','eps')



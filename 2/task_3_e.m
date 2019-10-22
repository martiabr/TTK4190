%% Tidy up

%% Nifty bits
deg2rad = pi/180;

%% System parameters
%Some other constants
V_a = 580/3.6;
aileron_sat = 30*deg2rad; %[deg]
g = 9.81;

%Inner loop transfer function parameters (B&C figure 6.9)
a_2 = -0.65;
a_1 = 2.87;

u_max = 30; %[deg]
e_max = 15; %[deg]

omega_phi = sqrt(abs(a_2)*(u_max/e_max));
seta_phi = 0.707;

k_p_phi = -(u_max/e_max);
k_d_phi = (2*seta_phi*omega_phi - a_1)/a_2;
k_i_phi = -0.001; %By observing root-locus-curves, see second_task.m

omega_chi = omega_phi/20;
seta_chi = 1; %Chosen for niceness

k_p_chi = 2*seta_chi*omega_chi*V_a/g;
k_i_chi = (omega_chi^2)*V_a/g;

%% Plots
figure(1)
hold on
grid on
title('Course \chi [rad]')
plot(course.time, course.signals.values);
plot(course_reference.time, course_reference.signals.values, '--r');
legend('True course', 'Reference course')
xlabel('Time [s]')
ylabel('Kåsj [rad]')

figure(2)
subplot(2,2,1);
hold on
grid on
title('Sideslip \beta [rad]')
plot(true_sideslip.time, true_sideslip.signals.values);
plot(beta_hat.time, beta_hat.signals.values);
leg = legend('$\beta$', '$\hat{\beta}$');
set(leg, 'Interpreter', 'latex');
xlabel('Time [s]')
ylabel('Sideslip [rad]')
hold off

subplot(2,2,2);
hold on
grid on
title('Roll \phi [rad]')
plot(true_roll.time, true_roll.signals.values);
plot(phi_hat.time, phi_hat.signals.values);
leg = legend('$\phi$', '$\hat{\phi}$');
set(leg, 'Interpreter', 'latex');
xlabel('Time [s]')
ylabel('Roll [rad]')
hold off

subplot(2,2,3);
hold on
grid on
title('Roll rate p [rad/s]')
plot(measured_roll_rate.time, measured_roll_rate.signals.values);
plot(true_roll_rate.time, true_roll_rate.signals.values);
plot(p_hat.time, p_hat.signals.values);
leg = legend('$p_m$', '$p$', '$\hat{p}$');
set(leg, 'Interpreter', 'latex');
xlabel('Time [s]')
ylabel('Roll rate [rad/s]')
hold off

subplot(2,2,4);
hold on
grid on
title('Yaw rate r [rad/s]')
plot(measured_yaw_rate.time, measured_yaw_rate.signals.values);
plot(true_yaw_rate.time, true_yaw_rate.signals.values);
plot(r_hat.time, r_hat.signals.values, 'LineWidth', 1);
leg = legend('$r_m$', '$r$', '$\hat{r}$');
set(leg, 'Interpreter', 'latex');
xlabel('Time [s]')
ylabel('Yaw rate [rad/s]')
hold off

figure(3)
hold on
grid on
title('Aileron input \delta_a [rad]')
plot(aileron_input.time, aileron_input.signals.values);
xlabel('Time [s]')
ylabel('Aileron angle [rad]')
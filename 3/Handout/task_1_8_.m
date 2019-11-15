%% Todo
%%Make these plots

%% Description
%%Solution to task 1_4: Plot some figures

%% Tidy up
close all;

%% Plot
%Plot surge
task_1_8_surge = figure(1);
hold on
grid on
plot(t, v(:,1))
plot(t, u_ref.signals.values, 'r--')
title('Surge')
xlabel('Time [s]')
ylabel('u [m]')
hold off
hgexport(task_1_8_surge,'task_1_8_surge.eps',myStyle,'Format','eps')

surge_error = u_ref.signals.values - v(:,1);
%Plot surge error
task_1_8_surge_error = figure(2);
hold on
grid on
plot(t, surge_error)
title('Surge error')
xlabel('Time [s]')
ylabel('$\tilde{u}$ [m]', 'Interpreter', 'latex')
hold off
hgexport(task_1_8_surge_error,'task_1_8_surge_error.eps',myStyle,'Format','eps')

%% Plot
%Plot heading
task_1_8_yaw = figure(3);
hold on
grid on
plot(t, rad2deg*psi)
title('Heading')
xlabel('Time [s]')
ylabel('\psi [deg]')
hold off
hgexport(task_1_8_yaw,'task_1_8_yaw.eps',myStyle,'Format','eps')


%Plot heading rate
task_1_8_r = figure(4);
hold on
grid on
plot(t, rad2deg*r)
title('Heading rate')
xlabel('Time [s]')
ylabel('r [deg/s]')
hold off
hgexport(task_1_8_r,'task_1_8_r.eps',myStyle,'Format','eps')

%Plot propeller input
task_1_8_nc = figure(5);
hold on
grid on
plot(t, n_c)
plot([tstart tstop], [85*2*pi/60 85*2*pi/60], 'r--')
title('Commanded shaft speed')
xlabel('Time [s]')
ylabel('n_{c} [rad/s]')
hold off
hgexport(task_1_8_nc,'task_1_8_nc.eps',myStyle,'Format','eps')

%Plot rudder input
task_1_8_delta = figure(6);
hold on
grid on
plot(t, rad2deg*delta.signals.values)
plot([tstart tstop], [25 25], 'r--')
plot([tstart tstop], [-25 -25], 'r--')
title('Rudder angle')
xlabel('Time [s]')
ylabel('\delta [deg]')
hold off
hgexport(task_1_8_delta,'task_1_8_delta.eps',myStyle,'Format','eps')
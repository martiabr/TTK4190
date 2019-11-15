%% Description
%%Solution to task 1_4: Plot some figures

%% Tidy up
close all;

%% Plot
%Plot heading
task_1_4_yaw = figure(1);
hold on
grid on
plot(t, rad2deg*psi)
plot(t, rad2deg*psi_ref.signals.values, 'r--')
title('Heading')
xlabel('Time [s]')
ylabel('\psi [deg]')
hold off
hgexport(task_1_4_yaw,'task_1_4_yaw.eps',myStyle,'Format','eps')

%Plot error
task_1_4_error = figure(2);
hold on
grid on
plot(t, rad2deg*error.signals.values)
title('Heading error')
xlabel('Time [s]')
ylabel('$\tilde{\psi}$ [deg]', 'Interpreter', 'latex')
hold off
hgexport(task_1_4_error,'task_1_4_error.eps',myStyle,'Format','eps')

%Plot heading rate
task_1_4_r = figure(3);
hold on
grid on
plot(t, rad2deg*r)
plot(t, rad2deg*r_ref.signals.values, 'r--')
title('Heading rate')
xlabel('Time [s]')
ylabel('r [deg/s]')
hold off
hgexport(task_1_4_r,'task_1_4_r.eps',myStyle,'Format','eps')

r_error = r_ref.signals.values - r;

%Plot error r
task_1_4_r_error = figure(4);
hold on
grid on
plot(t, rad2deg*r_error)
title('Heading rate error')
xlabel('Time [s]')
ylabel('$\tilde{r}$ [deg/s]', 'Interpreter', 'latex')
hold off
hgexport(task_1_4_r_error,'task_1_4_r_error.eps',myStyle,'Format','eps')

%Plot rudder input
task_1_4_input = figure(5);
hold on
grid on
plot(t, rad2deg*delta.signals.values)
plot([tstart tstop], [25 25], 'r--')
plot([tstart tstop], [-25 -25], 'r--')
title('Rudder angle')
xlabel('Time [s]')
ylabel('\delta [deg]')
hold off
hgexport(task_1_4_input,'task_1_4_input.eps',myStyle,'Format','eps')
%% Description 
%Plotter for task 1.2

%% Plot
a = r(2)/tsamp;
T_is = tstart:tsamp:T;

task_1_2 = figure(1);
hold on
grid on
plot(t, r)
plot([tstart tstop], [K K], 'r--')
plot(T_is, a*T_is, 'r--')
plot(40, K, 'rx')
title('Yaw rate step response')
xlabel('Time [s]')
ylabel('r [deg]')
hold off
hgexport(task_1_2,'task_1_2.eps',myStyle,'Format','eps')


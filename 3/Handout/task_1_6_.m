%% Description
%%Solution to Task 1_6: Identifying model parameters

%% Plot
b = v(2,1)/tsamp;
T_is = tstart:tsamp:5000;

task_1_6 = figure(1);
hold on
grid on
plot(t, v(:,1))
plot([tstart tstop], [K_u K_u], 'r--')
plot(T_is, b*T_is, 'r--')
plot(3850, K_u, 'rx')
title('Surge step response')
xlabel('Time [s]')
ylabel('u [m/s]')
hold off
hgexport(task_1_6,'task_1_6.eps',myStyle,'Format','eps')
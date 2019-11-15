%% Description
%%Solution to task 2.6: Some plots

%% Tidy up
close all;

%% Format data
beta_c = atan2(v(:,2), v(:,1));
chi = psi + beta_c;

%% Plot
%Course, heading, course desired, crab
task_2_6_course = figure(1);
hold on
grid on
plot(t, chi)
plot(t, psi)
plot(t, psi_d, 'r--')
plot(t, beta_c)
legend('\chi', '\psi', '\psi_d', '\beta_c')
title('Course, heading and crab-angle')
xlabel('Time [s]')
ylabel('Angle [rad]')
hold off
hgexport(task_2_6_course,'task_2_6_course.eps',myStyle,'Format','eps')


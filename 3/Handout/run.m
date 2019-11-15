%% Information 
% This file is only an example of how you can start the simulation. The
% sampling time decides how often you store states. The execution  time
% will increase if you reduce the sampling time.

% Please note that the file "pathplotter.m" (only used in the second part
% of the assignment) shows the ship path during the path following and
% target tracking part of the assignment. It can be clever to adjust the sampling
% time when you use that file because it draws a sketch of the ship in the
% North-East plane at each time instant. Having a small sampling time will
% lead to multiple ship drawings on top of each other. 

% You should base all of your simulink models on the MSFartoystyring model
% and extend that as you solve the assignment. For your own sake, it is
% wise to create a new model and run file for each task.

% The msfartoystyring.m file includes the ship model. You are not allowed
% to change anything within that file. You need to include that file in
% every folder where you have a simulink model based on
% "MSFartoystyring.slx". 

% WP.mat is a set of six waypoints that you need to use in the second part of
% the assignment. The north position is given in the first row and the east
% position in the second row. 

deg2rad = pi/180;
rad2deg = 180/pi;

%%
tstart=0;           % Sim start time
tstop=5000;        % Sim stop time
tsamp=10;           % Sampling time for how often states are stored. (NOT ODE solver time step)
                
p0=[1000 700]';      % Initial position (NED)
v0=[6.63 0]';       % Initial velocity (body)
psi0=60*deg2rad;             % Inital yaw angle
r0=0;               % Inital yaw rate
c=1;                % Current on (1)/off (0)

%% Nifty bits
deg2rad = pi/180;
rad2deg = 180/pi;

%% Define figure style
myStyle = hgexport('factorystyle');
myStyle.bounds = 'tight';
myStyle.Format = 'eps';
myStyle.Width = 6;
myStyle.Height = 2.5;
myStyle.Resolution = 300;
myStyle.Units = 'inch';
myStyle.FixedFontSize = 12;

%% 1. order Nomoto parameters
K = 6.5*10^-3;
T = 40;

%% Surge dynamics parameters
%u/n = K_u/(s + Tu)
K_u = 0.82;
T_u = 3.85*10^3;

%% Load controller variables from task 1.3 and 1.7
load('WP.mat');
task_1_3_
task_1_7_
sim MSFartoystyring_task_2 % The measurements from the simulink model are automatically written to the workspace.
pathplotter(p(:,1), p(:,2),  psi, tsamp, 20, tstart, tstop, 0, WP)


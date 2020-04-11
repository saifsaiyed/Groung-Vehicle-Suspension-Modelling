%% Parent file
% Student: Saif Saiyed (20793112)
%% Defining plant parameters to SIMULINK
clear;
close;
% Initialize values.
% Spring constant of the sprung-mass.
k_s = 586.39;
% Spring constant of the unsprung-mass.
k_t = 10*k_s;
% Experimentally estimated damping coefficient.
c = 60;
% Unsprung-mass.
m_u = 0.117;
% Sprung mass.
m_s = 0.437;
% Total length of time desired for simulink model.
t_length = 0.5;
% Time step for simulink model.
t_step = 0.0001;

%% Importing perfect haversine to SIMULINK

% Desired speed of the modified haversine (m/s).
v = 1;
%v = 1.72;
%v = 3.0;

% Generate haversine function.
H_mod = gen_modified_haversine(t_length, t_step, v);
t_mod = 0:t_step:t_length;
t_mod = [t_mod(1:end-1)].';

%% Importing Experimental Data to SIMULINK
% Import experiment data: Sprung
table_s = readtable('sprung_slow.xlsx');
t_s = table2array(table_s(:,1));
y_s = table2array(table_s(:,3));
y_s(end)=y_s(end-1);

% Import experiment data: Unsprung
table_u = readtable('unsprung_slow.xlsx');
t_u = table2array(table_u(:,1));
y_u = table2array(table_u(:,3));
y_u(end)=y_u(end-1);
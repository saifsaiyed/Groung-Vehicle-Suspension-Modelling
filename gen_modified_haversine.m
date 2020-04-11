function [ H_mod ] = gen_modified_haversine(t_length,t_step, v)

% Wavelenght of the modifiedhaversine
lambda = 0.496/2;
% Amplitude of the modified haversine.
A = 0.025;
% Angular frequency of the haversine.
omega = (2*pi*v)/lambda;
% Time for half haversine.
th1 = 0:t_step:0.5*pi/omega;
% First half of the halversine.
H_mod1 = (A/2)*(1-cos(2*omega*th1));
% Time for half haversine.
th2 = 0.5*pi/omega:t_step:pi/omega;
% Second half of the halversine.
H_mod2 = (A/2)*(1-cos(2*omega*th2));
% Number of step.
steps = round( t_length/t_step );
% Time of the flat region.
t_flat = 0.116/v;
% Number of step in flat region.
t_flat_step = t_flat/t_step;
amp_flat = A*ones(1,round(t_flat_step));
H_mod = [H_mod1 amp_flat H_mod2];
pad_num = steps - length(H_mod);
H_mod = [H_mod zeros(1,pad_num)]';
t_graph = t_step:t_step:t_length;
figure(3);
plot(t_graph,H_mod,'k');
ylabel('Amplitude');
xlabel('Time (s)');
end
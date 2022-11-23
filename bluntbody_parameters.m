close all
clear all
%% Crew Escape Module Parameters

m = ;
R = ;
g = ;
Iyy = ;
A = ;
D = ;
% rho = ;
Cmq = ;
Cmalphadot = ;

Tc = ;
lc = ;

Ka = ;
Kr = ;
Dis = ;

LTP = ;
UTP = ;
RCL = ;

figstr = 'b';


%% Data 
Data_Folder = 'D:\model\model\Trajectory and Aero Data CM and RCS';
cd(Data_Folder);
Contents = ls;

%Aero Coefficients 
aero_data = importdata(Contents(6,:)).data;
%Atmospheric Density
% Complete_Data2 = importdata(Contents(3,:)).data;
%Trajectory Data
trajectory_data = importdata(Contents(10,:)).data;

alpha = [aero_data(19:-1:1,1);aero_data(20:38,1)];
% a1 = [-180;a1];
Cl = [aero_data(19:-1:1,2);aero_data(20:38,2)];
% cl1 = [0.0022;cl1];
Cd = [aero_data(19:-1:1,3);aero_data(20:38,3)];
% cd1 = [0.2955;cd1];
Cmcg = [aero_data(19:-1:1,9);aero_data(20:38,9)];
% cmcg1 = [0.0087;cmcg1];

%Density data if needed
% altitude = trajectory_data(:,2)*1000;
% rho = Complete_Data2.data(:,4);

%% Plots Aero Data
% plot alpha vs CmCg curve to find the trim points of the Crew Module
figure();
plot(alpha, Cmcg);
grid on

%% Simulation

Run_Folder = 'D:\model\model';
cd(Run_Folder);
out = sim('Body_Dynamics',200);
%% Plot Output Data

figure();
plot(out.time_sim,out.theta_sim)
grid on
xlabel('Time (sec)');
ylabel('$\theta$(deg)',Interpreter='latex');

figure();
plot(out.time_sim,out.thetadot_sim)
grid on
xlabel('Time (sec)');
ylabel('$\dot{\theta}$(deg/s)',Interpreter='latex');

figure();
plot(out.theta_sim,out.thetadot_sim)
grid on
xlabel('$\theta$(deg)',Interpreter='latex');
ylabel('$\dot{\theta}$(deg/s)',Interpreter='latex');

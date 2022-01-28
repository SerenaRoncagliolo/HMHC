%Thanh Nguyen 10/12/2020

% Install robotic toolbox from here:
% https://petercorke.com/toolboxes/robotics-toolbox/
% For MATLAB 2020 go to motions/read.m line 175 change it to :
% save(Motion+"_q",'motion'); 

%%% Important update: 
%1/ Motion can be defined in variable name Motion
%2/ Then, depending on the motion, you can choose between double_support.m or
% mix_support.m
%3/ then, you can run main.m

%4/ every motion has different starting point, so matching them takes some
%time for each motion. 
clc;
close all;
global animation Motion M freq
%% add path
addpath('NE');
addpath('animation');
addpath('motions');
addpath('Hanavan_model');

%% main 
% if you find mistakes in double_support.m, mix_support.m, NE_one_body.m PLEASE let me
% know first, then we can fix together. 

% animation = true/false
animation = false;

% Avilable Motions : 
% custom motion: "custom" , "custom2" , "customL" , 
% hand-waving: "fastArm",  "slowArm" , "mediumArm" , "mediumArmNOSTOMP"
% one leg kicking: "fastKick" , "fastKickArm" , "mediumKick" , "mediumKickArm" , "slowKick" , "slowKickArm"
% vertical jumping: "maxJump" , "maxJump2" ,  "medJump" , "quickJump", "jumpFeetUp"
Motion = "slowArm" ;
M = 80; % mass of person derived from some staic pose (Fz/g)
%increase the number if your pcis slow
freq = 20; % it decreases the reading for animation


%to change the motion, and display animation, change parameter in Run.m
run('Run.m');

%run these from double support motion (jumping, sitting, waving hand)
% run('double_support.m');
% run('plot_ground_reaction.m');

%run these from mix support motion (custom, kicking)
run('mix_support.m');
run('plot_ground_reaction.m');
%% Plot tips
%to match with the force data, change the offset in t function 
% in plot_ground_reaction.m

% to plot separately force data and computed grf, change the plot functions
% in plot_ground_reaction.m
%% Notes
%the frequency of motion capture is f = 60Hz, it is used to compute the
%ground reaction in double_support.m and mix_support.m

%F_z is the most important to look, and should be used to matching

%F_x, F_y are often influtuated, this is normal, have to explain in the
%report.
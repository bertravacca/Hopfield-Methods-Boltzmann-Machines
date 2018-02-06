%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Economic Load Dispatch for Piecewise Quadratic
% Cost Function Using Hopfield Neural Network
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

addpath([pwd,'/Hopfield']);
addpath([pwd,'/Hopfield/activation_functions']);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Set Parameters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% First, define the number of agents
p.n= 1000;
% Define the cost coefficients
p.a= 10+20*(rand(p.n,1)-0.5);
p.b= 50+100*(rand(p.n,1)-0.5);
p.c= 0.1+0.2*(rand(p.n,1)-0.5);

% Define maximum and minimum power
p.P_max= 100+1000*rand(p.n,1);
p.P_min= max(0,p.P_max.*(rand(p.n,1)-0.5));

% Define total load
p.D= sum(p.P_max)/(1.2+rand());

% Define tolerance for the constraint supply=demand
p.tolerance     = 0.01;

% Define weight factors
% Constraint factors
p.A= 1;
% Cost factor
p.B= 0.1;




% Define step-size and number of iterations for the algorithms
simu.step_size=0.15/(p.n);

% Initialization
simu.P_init     = 0.5*(p.P_max+p.P_min).*(1+0.2*(rand(p.n,1)-0.5));
simu.P_H_init   = simu.P_init;

% Number of iteration 
simu.N_iter=100;

% Temperature for integer problem
simu.temperature = 0.01;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Run one simulation for different algorithms
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% List of acronyms
% PGD: projected gradient descent
% SHM: Hopfield Network with soft activation
% PHM: Hopfield Network with piecewise linear activation
% QP:  quadprog (interior point method)
% OA:  outer approximation algorithm

results=algos_eco_dispatch(p,simu);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Visualization
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
visualization
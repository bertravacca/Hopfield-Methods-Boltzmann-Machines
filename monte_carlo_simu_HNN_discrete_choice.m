% Economic Load Dispatch for Piecewise Quadratic
% Cost Function Using Hopfield Neural Network
clear all; clc; close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Set Parameters Randomly
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
N_monte_carlo=5000;
N_iter=50;

cost_PGD_history=zeros((N_iter+1)*N_monte_carlo,2);
cost_SHNN_1_history=zeros((N_iter+1)*N_monte_carlo,2);
cost_PlHNN_1_history=zeros((N_iter+1)*N_monte_carlo,2);

real_cost_PGD_history=zeros(N_monte_carlo,1);
real_cost_SHNN_1_history=zeros(N_monte_carlo,1);
real_cost_PlHNN_1_history=zeros(N_monte_carlo,1);

for n_sim=1:N_monte_carlo
    [cost_PGD,cost_SHNN_1,cost_PlHNN_1,real_cost_PGD,real_cost_SHNN_1,real_cost_PlHNN_1]=simu_HNN_discrete_choice(N_iter);
    r=(n_sim-1)*(N_iter+1)+1:n_sim*(N_iter+1);
    cost_PGD_history(r,1:2)=[cost_PGD;(1:1:(N_iter+1))]';
    cost_SHNN_1_history(r,1:2)=[cost_SHNN_1;(1:1:(N_iter+1))]';
    cost_PlHNN_1_history(r,1:2)=[cost_PlHNN_1;(1:1:(N_iter+1))]';
    
    real_cost_PGD_history(n_sim)=real_cost_PGD;
    real_cost_SHNN_1_history(n_sim)=real_cost_SHNN_1;
    real_cost_PlHNN_1_history(n_sim)=real_cost_PlHNN_1;
end
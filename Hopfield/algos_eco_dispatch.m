
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Test different algorithms
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% List of acronyms
% PGD: projected gradient descent
% SHM: Hopfield Network with soft activation
% PHM: Hopfield Network with piecewise linear activation
% QP:  quadprog (interior point method)
% OA:  outer approximation algorithm -> MILP

function[results]=algos_eco_dispatch(p,simu)

% Projected gradient descent (PGD)
[results.sol_PGD,results.cost_PGD]   = PGD(p,simu);
% Hopfield with sigmoid(SHM);
[results.sol_SHM,results.cost_SHM]   = SHM(p,simu);
% Hopfield with piecewise linear activation(PHM);
[results.sol_PHM,results.cost_PHM]   = PHM(p,simu);
% Binary relaxed solution using QP
[results.sol_QP,results.cost_QP]     = quadprog(2*diag(p.c),p.b,zeros(p.n,p.n),zeros(p.n,1),ones(1,p.n),p.D,p.P_min,p.P_max);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Post process 1: projection for discrete variables
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[results.sol_PGD_1,results.cost_PGD_1,results.unbalance_PGD_1] = post_process_1(p,results.sol_PGD);
[results.sol_SHM_1,results.cost_SHM_1,results.unbalance_SHM_1] = post_process_1(p,results.sol_SHM);
[results.sol_PHM_1,results.cost_PHM_1,results.unbalance_PHM_1] = post_process_1(p,results.sol_PHM);
[results.sol_QP_1,results.cost_QP_1,results.unbalance_QP_1]    = post_process_1(p,results.sol_QP);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Post Process 2: Use continuous variables as a recourse to adjust supply and demand
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[results.sol_PGD_2,results.cost_PGD_2,results.unbalance_PGD_2] = post_process_2(p,results.sol_PGD_1);
[results.sol_SHM_2,results.cost_SHM_2,results.unbalance_SHM_2] = post_process_2(p,results.sol_SHM_1);
[results.sol_PHM_2,results.cost_PHM_2,results.unbalance_PHM_2] = post_process_2(p,results.sol_PHM_1);
[results.sol_QP_2,results.cost_QP_2,results.unbalance_QP_2]    = post_process_2(p,results.sol_QP_1);

end

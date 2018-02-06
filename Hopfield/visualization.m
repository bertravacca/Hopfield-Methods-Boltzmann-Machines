
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Visualization
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all;
figure(1) % convergence rates
plot(log(results.cost_PGD),'r--')
hold on
plot(log(results.cost_SHM),'b--')
plot(log(results.cost_PHM),'g--')


figure(2) % Cost after process 1
bar([results.cost_QP_1,results.cost_PGD_1,results.cost_SHM_1,results.cost_PHM_1])

figure(3) % supply=demand after process 1
bar([results.unbalance_QP_1,results.unbalance_PGD_1,results.unbalance_SHM_1,results.unbalance_PHM_1])

figure(4) % look if the constraint supply=demand is respected
bar([results.cost_QP_2,results.cost_PGD_2,results.cost_SHM_2,results.cost_PHM_2])

figure(5) % supply=demand after process 1
bar([results.unbalance_QP_2,results.unbalance_PGD_2,results.unbalance_SHM_2,results.unbalance_PHM_2])

figure(6)
hist((results.sol_PHM(1:p.n/2)-p.P_min(1:p.n/2))./(p.P_max(1:p.n/2)-p.P_min(1:p.n/2)),50)

figure(7)
hist((results.sol_PHM(p.n/2+1:p.n)-p.P_min(p.n/2+1:p.n))./(p.P_max(p.n/2+1:p.n)-p.P_min(p.n/2+1:p.n)),50)

figure(8)
hist((results.sol_QP(1:p.n/2)-p.P_min(1:p.n/2))./(p.P_max(1:p.n/2)-p.P_min(1:p.n/2)),50)

figure(9)
hist((results.sol_QP(p.n/2+1:p.n)-p.P_min(p.n/2+1:p.n))./(p.P_max(p.n/2+1:p.n)-p.P_min(p.n/2+1:p.n)),50)

figure(10)
hist((results.sol_PGD(1:p.n/2)-p.P_min(1:p.n/2))./(p.P_max(1:p.n/2)-p.P_min(1:p.n/2)),50)

figure(11)
hist((results.sol_PGD(p.n/2+1:p.n)-p.P_min(p.n/2+1:p.n))./(p.P_max(p.n/2+1:p.n)-p.P_min(p.n/2+1:p.n)),50)
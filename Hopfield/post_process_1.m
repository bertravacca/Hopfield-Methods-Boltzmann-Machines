% We project on {P_min,P_max} the obtained solution
function[sol,cost,unbalance]=post_process_1(p,sol)
sol        = [pl_infinite(sol(1:p.n/2),p.n/2,p.P_min,p.P_max);sol(p.n/2+1:p.n)];
cost       = ones(p.n,1)'*p.a+p.b'*sol+sol'*diag(p.c)*sol;
unbalance  = abs(p.D-sum(sol))/p.D;
end

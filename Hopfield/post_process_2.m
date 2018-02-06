% Distribute the difference between supply and demand between 'continuous agents'
function[sol,cost,unbalance]=post_process_2(p,sol)
unbalance    = p.D-sum(sol);
n            = p.n/2;
sol1         = sol(1:n);
sol2         = sol(n+1:2*n);
while abs(unbalance)/p.D > p.tolerance
    sol2     = pl_activation(sol2+unbalance/n,n,p.P_min(n+1:2*n),p.P_max(n+1:2*n),ones(n,1));
    sol      = [sol1;sol2];
    unbalance= p.D-sum(sol);
end

cost         =  ones(p.n,1)'*p.a+p.b'*sol+sol'*diag(p.c)*sol;
unbalance    = abs(p.D-sum(sol))/p.D;
end

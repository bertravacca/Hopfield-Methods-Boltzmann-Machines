function[sol,fval]=PGD(p,simu)

% Initialize power dispatch
P=simu.P_init;

% Keep cost history
fval=zeros(1,simu.N_iter+1);
fval(1)=p.A/2*(p.D-ones(p.n,1)'*P)^2+p.B/2*(ones(p.n,1)'*p.a+p.b'*P+P'*diag(p.c)*P);

% Gradient Descent with projection
for iter=1:simu.N_iter
    P_H=P-simu.step_size*((p.A*ones(p.n,p.n)+p.B*diag(p.c))*P-p.A*p.D*ones(p.n,1)+0.5*p.B*p.b);
    P=pl_activation(P_H,p.n,p.P_min,p.P_max,ones(p.n,1));
    fval(iter+1)=p.A/2*(p.D-ones(p.n,1)'*P)^2+p.B/2*(ones(p.n,1)'*p.a+p.b'*P+P'*diag(p.c)*P);
end
sol=P;
end

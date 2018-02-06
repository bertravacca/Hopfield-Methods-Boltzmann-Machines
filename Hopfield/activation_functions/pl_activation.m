function[out]=pl_activation(x,n,x_min,x_max,temperature)
    out=zeros(n,1);
    for k=1:n
        center=0.5*(x_max(k)+x_min(k));
        a=1/temperature(k);
        b=center*(1-a);
        out(k)=max(min(a*x(k)+b,x_max(k)),x_min(k));
    end
end
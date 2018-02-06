function[out]=sigmoid(x,n,x_min,x_max,temperature)
    out=zeros(n,1);
    for k=1:n
        center=0.5*(x_max(k)+x_min(k));
        T=temperature(k)*(x_max(k)-x_min(k))/4;
        diff=x_max(k)-x_min(k);
        out(k)=x_min(k)+diff/(1+exp(-1/T*(x(k)-center)));
    end
end

function[out]=pl_infinite(x,n,x_min,x_max)
    out=zeros(n,1);
    for k=1:n
        center=0.5*(x_max(k)+x_min(k));
        if x(k)>center
            out(k)=x_max(k);
        else
            out(k)=x_min(k);
        end

    end
end
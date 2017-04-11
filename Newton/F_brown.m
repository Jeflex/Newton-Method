function F=F_brown(x)

n=length(x);

for k=1:n-1
    F(k,1)=x(k)+sum(x)-n-1;
end

F(n,1)=prod(x)-1;
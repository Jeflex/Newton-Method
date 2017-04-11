function F=F_eiger_sikorski_stenger(x)

n=length(x);

for i=1:n-1
    F(i,1)=(x(i)-0.01)^2+x(i+1);
end

F(n,1)=x(n)-0.1+x(1)-0.1;
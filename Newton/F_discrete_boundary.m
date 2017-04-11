function F=F_discrete_boundary(x)

n=length(x);
h=1/(n+1);
F(1,1)=2*x(1)-x(2)+h^2*(x(1)+h+1)^3/2;
for i=2:n-1
    F(i,1)=2*x(i)-x(i-1)-x(i+1)+h^2*(x(i)+i*h+1)^3/2;
end

F(n,1)=2*x(n)-x(n-1)+h^2*(x(n)+n*h+1)^3/2;
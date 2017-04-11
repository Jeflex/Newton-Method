function J=Jac_discrete_boundary(x)

n=length(x);
h=1/(n+1);

J(1,1)=2+3*h^2*(x(1)+h+1)^2/2;
J(1,2)=-1;
for i=2:n-1
    J(i,i-1)=-1;
    J(i,i)=2+3*h^2*(x(i)+i*h+1)^2/2;
    J(i,i+1)=-1;
end
J(n,n-1)=-1;
J(n,n)=2+3*h^2*(x(n)+i*h+1)^2/2;

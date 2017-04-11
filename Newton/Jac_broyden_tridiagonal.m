function J=Jac_broyden_tridiagonal(x)

m=length(x);
J(1,1)=3-4*x(1);
J(1,2)=-2;
for i=2:m-1
J(i,i-1)=-1;
J(i,i)=3-4*x(i);
J(i,i+1)=-2;
end
J(m,m-1)=-1;
J(m,m)=3-4*x(m);





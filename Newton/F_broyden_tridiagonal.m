function F=F_broyden_tridiagonal(x)

m=length(x);

F(1,1)=(3-2*x(1))*x(1)-2*x(2)+1;
for i=2:m-1
F(i,1)=(3-2*x(i))*x(i)-x(i-1)-2*x(i+1)+1;    
end
F(m,1)=(3-2*x(m))*x(m)-x(m-1)+1;





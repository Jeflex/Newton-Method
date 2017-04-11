function J=Jac_eiger_sikorski_stenger(x)

n=length(x);

for i=1:n-1
   J(i,i)=2*(x(i)-0.01);
   J(i,i+1)=1;
end

J(n,1)=1;
J(n,n)=1;
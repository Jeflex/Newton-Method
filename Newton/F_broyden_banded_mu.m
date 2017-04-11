function F=F_broyden_banded_mu(x,lambda)

n=length(x);
ml=5; mu=1;
for i=1:n
    J=max(1,i-ml):min(n,i+mu);
    J=J(J~=i);
   F(i,1)=x(i)*(lambda+5*x(i)^2)+1-(sum(x(J).*(1+x(J))));
end
function JJ=Jac_broyden_banded(x)

n=length(x);
ml=5; mu=1;
for i=1:n
    J=max(1,i-ml):min(n,i+mu);
    J=J(J~=i);
   JJ(i,i)=2+15*x(i)^2;
   JJ(i,J)=-sum(1+2*x(J));
end
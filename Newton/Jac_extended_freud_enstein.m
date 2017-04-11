function J=Jac_extended_freud_enstein(x)

n=length(x);

for i=1:n
    if mod(i,2)==1
    J(i,i)=1;
    J(i,i+1)=10*x(i+1)-3*x(i+1)^2-2;
    end
    
    if mod(i,2)==0
    J(i,i-1)=1;
    J(i,i)=3*x(i)^2+2*x(i)-14;
    end
end


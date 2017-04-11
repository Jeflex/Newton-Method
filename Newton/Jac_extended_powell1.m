function J=Jac_extended_powell1(x)

n=length(x);

for i=1:n
    if mod(i,4)==1
    
    J(i,i)=1;
    J(i,i+1)=10;
    end
    
    if mod(i,4)==2
    J(i,i+1)=sqrt(5);
    J(i,i+2)=-sqrt(5);
    end
    
    if mod(i,4)==3
    J(i,i-1)=2*(x(i-1)-2*x(i));
    J(i,i)=-4*(x(i-1)-2*x(i));
    end
    
    if mod(i,4)==0
    J(i,i-3)=2*sqrt(10)*(x(i-3)-x(i));
    J(i,i)=2*sqrt(10)*(x(i-3)-x(i));
    end
end


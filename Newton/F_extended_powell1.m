function F=F_extended_powell1(x)

n=length(x);

for i=1:n
    if mod(i,4)==1
    F(i,1)=x(i)+10*x(i+1);
    end
    
    if mod(i,4)==2
    F(i,1)=sqrt(5)*(x(i+1)-x(i+2));
    end
    
    if mod(i,4)==3
    F(i,1)=(x(i-1)-2*x(i))^2;
    end
    
    if mod(i,4)==0
    F(i,1)=sqrt(10)*(x(i-3)-x(i))^2;
    end
end


function F=F_extended_wood(x)

n=length(x);
if mod(n,4)~=0
    disp('Length of x must be multiple of 4')
    return
else
for i=1:n
    if mod(i,4)==1
        F(i,1)=-200*x(i)*(x(i+1)-x(i)^2)-(1-x(i));
    end
    
    if mod(i,4)==2
        F(i,1)= 200*(x(i)-x(i-1)^2)+20*(x(i)-1)+19.8*(x(i+2)-1);
    end
    
    if mod(i,4)==3 
        F(i,1)=-180*x(i)*(x(i+1)-x(i)^2)-(1-x(i));
    end
    
    if mod(i,4)==0
        F(i,1)=180*x(i)*(x(i)-x(i-1)^2)+20.2*(x(i)-1)+19.8*(x(i-2)-1);
    end
end
end


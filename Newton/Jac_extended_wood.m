function J=Jac_extended_wood(x)

n=length(x);
if mod(n,4)~=0
    disp('Length of x must be multiple of 4')
    return
else
for i=1:n
    if mod(i,4)==1
        J(i,i)=600*x(i)^2-200*x(i+1)-1;
        J(i,i+1)=-200*x(i);
    end
    
    if mod(i,4)==2
        J(i,i-1)=-400*x(i-1);
        J(i,i)=220;
        J(i,i+2)=19.8;
    end
    
    if mod(i,4)==3 
       J(i,i)=-180*x(i+1)+3*180*x(i)^2+1;
       J(i,i+1)=-180*x(i);
    end
    
    if mod(i,4)==0
        J(i,i-2)=19.8;
        J(i,i-1)=-360*x(i)*x(i-1);
        J(i,i)=360*x(i)-180*x(i-1)^2+20.2;
    end
end
end


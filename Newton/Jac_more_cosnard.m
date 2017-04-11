function J=Jac_more_cosnard(x)

m=length(x);
h=1/(m+1);
t=h*[1:m]';

 for k=1:m
     for i=1:m
         if i <=k
             J(k,i)=((i-k)==0)+(3/2)*h*(x(i)+t(i)+1)^2*(1-t(k))*t(i);
         else
             J(k,i)=((i-k)==0)+(3/2)*h*(x(i)+t(i)+1)^2*t(k)*(1-t(i));
         end
     end
     
 end
 







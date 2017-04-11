function J=Jac_yamamura(x)

m=length(x);

 for k=1:m
     for i=1:m
         if i ==k
             J(k,i)=7.5*x(i)^2-21*x(i)+12.8;
         else
             J(k,i)=1;
         end
     end
     
 end
 







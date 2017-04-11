function F=F_more_cosnard(x)

m=length(x);
h=1/(m+1);
t=h*[1:m]';

 for k=1:m
     suma1=(1-t(k))*sum(t(1:k).*(x(1:k)+t(1:k)+1).^3);
     suma2=(t(k))*sum((1-t(k+1:m)).*(x(k+1:m)+t(k+1:m)+1).^3);
     F(k,1)=x(k)+0.5*h*(suma1+suma2);
 end
 







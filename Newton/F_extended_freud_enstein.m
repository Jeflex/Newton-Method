function F=F_extended_freud_enstein(x)

n=length(x);

for i=1:n
    if mod(i,2)==1
    F(i,1)=x(i)+((5-x(i+1))*x(i+1)-2)*x(i+1)-13;
    end
    
    if mod(i,2)==0
    F(i,1)=x(i-1)+((x(i)+1)*x(i)-14)*x(i)-29;
    end
end


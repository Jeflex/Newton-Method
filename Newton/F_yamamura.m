function F=F_yamamura(x)

m=length(x);

for i=1:m
    F(i,1)=2.5*x(i)^3 - 10.5*x(i)^2 + 11.8*x(i) - i+sum(x);
end





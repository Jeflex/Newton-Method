function J=Jac_brown(x)

n=length(x);

for k=1:n-1
    for j=1:n
        if j==k
        J(k,j)=2;
        else
            J(k,j)=1;
        end
    end
end

J(n,1)=prod(x(2:n));
for j=2:n-1
J(n,j)=prod(x([[1:j-1],[j+1:n]]));
end

J(n,n)=prod(x(1:n-1));

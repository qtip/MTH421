clear all;

x=[1;1];
tol=1.e-10;
kmax=7;
flag=0;
k=1;
fprintf('%16.12f %16.12f\n', x(1), x(2))
while flag==0
    g0 = g(x);
    jac=dg(x);
    h = jac\(-g0);
    x1 = x + h;
    x = x1;
    if k>kmax || norm(h)<tol
        flag=1;
    else
        k=k+1;
    end
    fprintf('%16.12f %16.12f\n', x1(1), x1(2))
end
    
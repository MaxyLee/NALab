disp("equation 1:");
x0 = 0.6;
xk = x0;
delta = 1e-5;
lambda0 = 1;
xkp = xk - lambda0 * f1(xk) / df1(xk);
while abs(f1(xk)) > delta || abs(xkp-xk) > delta
    s=f1(xk) / df1(xk);
    xkp = xk - s;
    lambda = lambda0;
    while double(abs(f1(xkp))) >= double(abs(f1(xk)))
        xkp = xk - lambda * s;
        lambda = lambda / 2;
    end
    xk = xkp;
    disp(lambda);
    disp(xkp);
end
disp(xkp);
sol = fzero(@f1, x0);
disp("fzero:");
disp(sol);

disp("equation 2:");
x0 = 1.35;
xk = x0;
delta = 1e-5;
lambda0 = 1;
xkp = xk - lambda0 * f2(xk) / df2(xk);
while abs(f2(xk)) > delta || abs(xkp-xk) > delta
    s=f2(xk) / df2(xk);
    xkp = xk - s;
    lambda = lambda0;
    while double(abs(f2(xkp))) >= double(abs(f2(xk)))
        xkp = xk - lambda * s;
        lambda = lambda / 2;
    end
    xk = xkp;
    disp(lambda);
    disp(xkp);
end
disp(xkp);
sol = fzero(@f2, x0);
disp("fzero:");
disp(sol);

return
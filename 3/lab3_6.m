n = 12;
H = hilb(n);
x = ones(n,1);
b = H * x;
L = cholesky(H);
sol = L.' \ (L \ b);
r = b - H * sol;
dx = sol - x;
disp("norm(r): " + norm(r,inf));
disp("norm(dx): " + norm(dx,inf));

bd = b + ones(n,1) * 1e-7;
sold = L.' \ (L \ bd);
rd = bd - H * sold;
dxd = sold - x;
disp("norm(rd): " + norm(rd,inf));
disp("norm(dxd): " + norm(dxd,inf));
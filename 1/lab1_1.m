h = logspace(-16,0,1000);
truncation = h/2;
rounding = 0.0000000000000001 * h.^-1;
epsilon = truncation + rounding;
error = abs(((sin(1 + h) - sin(1)) ./ h) - cos(1));
plot(h, epsilon, h, truncation, h, rounding, h, error),loglog(h,epsilon,'--r', h, truncation, '--k', h, rounding, '--k', h, error),axis([0.0000000000000001 1 0.00000000000000001 10]);
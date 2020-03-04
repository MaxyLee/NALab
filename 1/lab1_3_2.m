ssum = single(1);
slast = single(0);
dsum = 1;
j = 1;
i = 1;

while ssum - slast ~= 0
    slast = ssum;
    j = j + 1;
    ssum = ssum + 1/j;
end

while i ~= j
    i = i + 1;
    dsum = dsum + 1/i;
end

disp(ssum)
disp(dsum)
disp((ssum - dsum) / dsum);
# <center>report 3</center>

<center>马昕宇 2017011455</center>
## 实验要求

编程序生成 Hilbert 矩阵$H_n$，以及$n$维向量$b = H_n x$，其中$x$为所有分量都是1的向量。用 Cholesky 分解算法求解方程$H_n x = b$，得到近似解$\hat{x}$，计算残差$r = b - H_n \hat{x}$和误差$\Delta x = \hat{x} - x$的$\infty$范数。 

1. 设$n = 10$，计算$||r||_\infty$、 $||\Delta x||_\infty$
2. 在右端项上施加$10^{-7}$ 的扰动然后解方程组，观察残差和误差的变化情况 
3. 改变$n$的值为8和12，求解相应的方程，观察$||r||_\infty$、 $||\Delta x||_\infty$的变化情况。通过这个实验说明了什么问题？


## 算法实现

算法主要代码如下：

```matlab
% cholesky.m
function L = cholesky(A)
    n = size(A, 1);
    L = zeros(n, n);
    L(1, 1) = sqrt(A(1, 1));
    for j = 1 : n
        for k = 1 : j - 1
            A(j, j) = A(j, j) - A(j ,k) * A(j, k);
        end
        A(j, j) = sqrt(A(j, j));
        L(j, j) = A(j, j);
        for i = j + 1 : n
            for k = 1 : j - 1
                A(i, j) = A(i, j) - A(i, k) * A(j, k);
            end
            A(i, j) = A(i, j) / A(j, j);
            L(i, j) = A(i, j);
        end
    end
end

% lab3_6.m
n = 10;
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
```


## 实验结果

n = 10时，输出结果如下：

```shell
>> lab3_6
norm(r): 4.4409e-16
norm(dx): 0.00040521
norm(rd): 4.4409e-16
norm(dxd): 0.70073
```

n = 8时，输出结果如下：

```shell
>> lab3_6
norm(r): 4.4409e-16
norm(dx): 7.0128e-07
norm(rd): 2.2204e-16
norm(dxd): 0.021622
```

n = 12时，输出结果如下：

```shell
>> lab3_6
norm(r): 4.4409e-16
norm(dx): 0.055272
norm(rd): 2.2204e-16
norm(dxd): 23.7071
```

由此可见当n增大时，残差$r$基本没有变化，但是误差却显著增大，并且对于扰动更加敏感，这也验证了Hilbert矩阵是病态矩阵的事实。
















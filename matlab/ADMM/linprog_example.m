% Standard form LP with random data
randn('state', 0);
rand('state', 0);

n = 5000;  % dimension of x
m = 4000;  % number of equality constraints

c  = rand(n,1) + 0.5;    % create nonnegative price vector with mean 1
x0 = abs(randn(n,1));    % create random solution vector

A = abs(randn(m,n));     % create random, nonnegative matrix A
b = A*x0;

[x history] = linprog(c, A, b, 1.0, 1.0);

[z,history_cvx] = linprog_cvx(c, A, b);

K = length(history.objval);
sprintf('Optimal value of ADMM is %.2f , of CVX is %.2f',history.objval(K),history_cvx.optimal_val )

h = figure;
subplot(2,2,[1,3]);
plot(1:K, history.objval, 'k', 'MarkerSize', 10, 'LineWidth', 2);
ylabel('f(x^k) + g(z^k)'); xlabel('iter (k)');

subplot(2,2,2);
semilogy(1:K, max(1e-8, history.r_norm), 'k', ...
    1:K, history.eps_pri, 'k--',  'LineWidth', 2);
ylabel('||r||_2');

subplot(2,2,4);
semilogy(1:K, max(1e-8, history.s_norm), 'k', ...
    1:K, history.eps_dual, 'k--', 'LineWidth', 2);
ylabel('||s||_2'); xlabel('iter (k)');
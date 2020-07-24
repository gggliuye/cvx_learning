% Total variation denoising with random data
clc; clear;

rand('seed', 0);
randn('seed', 0);

n = 100;

x0 = ones(n,1);
for j = 1:3
    idx = randsample(n,1);
    k = randsample(1:10,1);
    x0(ceil(idx/2):idx) = k*x0(ceil(idx/2):idx);
end
b = x0 + randn(n,1);

lambda = 5;

e = ones(n,1);
D = spdiags([e -e], 0:1, n,n);


[x history] = total_variation(b, lambda, 1.0, 1.0);

K = length(history.objval);

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

%%% CVX method
t_start = tic;
xtv = zeros(n,1);
gamma_l1 = 0.9;
cvx_begin quiet
    variable xtv(n,1);
    xtv_diff = xtv(2:end,1) - xtv(1:end-1,1); % x (horiz) differences
    minimize(norm(xtv_diff, 1) + gamma_l1*norm(xtv-b,2)); %tv roughness measure
cvx_end
toc(t_start);

g = figure;
hold on;
plot(x0);
plot(b);
plot(x);
plot(xtv);
legend('original data','noised data','admm result','cvx sdp result');

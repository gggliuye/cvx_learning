function [z, history] = quadprog_cvx(P, q, A, b)

t_start = tic;

% use cvx method to solve LP
[m, n] = size(A);
cvx_begin 
    variable x(n)
    minimize((1/2)*x'*P*x + q'*x);
    subject to
        x >= 0;
        A * x == b;
cvx_end

toc(t_start);
z = x;
history.optimal_val = cvx_optval;
end


function [z, history] = linprog_cvx(c, A, b)

t_start = tic;

% use cvx method to solve LP
[n] = size(c);
cvx_begin quiet
    variable x(n)
    minimize(c'*x);
    subject to
        x >= 0;
        A * x == b;
cvx_end

toc(t_start);
z = x;
history.optimal_val = cvx_optval;
end


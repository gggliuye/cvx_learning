function [x, history] = total_variation_2d(x0, H, lambda, rho)
% total_variation  Solve total variation minimization via ADMM
%
% [x, history] = total_variation(b, lambda, rho, alpha)
%
% Solves the following problem via ADMM:
%
%   minimize  (1/2)||x - b||_2^2 + lambda * sum_i |x_{i+1} - x_i|
%
% where b in R^n.
%
% The solution is returned in the vector x.
%
% history is a structure that contains the objective value, the primal and
% dual residual norms, and the tolerances for the primal and dual residual
% norms at each iteration.
%
% rho is the augmented Lagrangian parameter.
%
% alpha is the over-relaxation parameter (typical values for alpha are
% between 1.0 and 1.8).
%
%
% More information can be found in the paper linked at:
% http://www.stanford.edu/~boyd/papers/distr_opt_stat_learning_admm.html
%

t_start = tic;

QUIET    = 1;
MAX_ITER = 1000;
ABSTOL   = 1e-4;
RELTOL   = 1e-2;

[m, n] = size(x0);

% we will only process square input

% difference matrix
e = ones(n,1);
D = spdiags([e -e], 0:1, n,n);

x = zeros(n,n);
z = zeros(n,n);
u = zeros(n,n);

if ~QUIET
    fprintf('%3s\t%10s\t%10s\t%10s\t%10s\t%10s\n', 'iter', ...
      'r norm', 'eps pri', 's norm', 'eps dual', 'objective');
end

DtD = D'*D;
HtH = H'*H;

for k = 1:MAX_ITER

    % x-update
    x = (rho*DtD + HtH) \ (H'*x0 + rho*D'*(z-u));

    % z-update with relaxation
    Dx = D*x;
    zold = z;
    z = shrinkage(Dx + u, lambda/rho);

    % y-update
    u = u + Dx - z;


    % diagnostics, reporting, termination checks
    history.objval(k)  = objective(x0, H, lambda, D, x, z);

    history.r_norm(k)  = norm(D*x - z);
    history.s_norm(k)  = norm(-rho*D'*(z - zold));

    history.eps_pri(k) = sqrt(n)*ABSTOL + RELTOL*max(norm(D*x), norm(-z));
    history.eps_dual(k)= sqrt(n)*ABSTOL + RELTOL*norm(rho*D'*u);

    if ~QUIET
        fprintf('%3d\t%10.4f\t%10.4f\t%10.4f\t%10.4f\t%10.2f\n', k, ...
            history.r_norm(k), history.eps_pri(k), ...
            history.s_norm(k), history.eps_dual(k), history.objval(k));
    end

    if (history.r_norm(k) < history.eps_pri(k) && ...
       history.s_norm(k) < history.eps_dual(k))
         break;
    end
end

if ~QUIET
    toc(t_start);
end

end


function obj = objective(x0, H, lambda, D, x, z)
    obj = .5*norm(H*x - x0)^2 + lambda*norm(z,1);
end

function y = shrinkage(a, kappa)
    y = max(0, a-kappa) - max(0, -a-kappa);
end
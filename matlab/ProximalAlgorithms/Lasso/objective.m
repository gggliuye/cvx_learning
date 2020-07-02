function [ value ] = objective(A, b, gamma, x_l2, x_l1)
% the objective value of the lasso problem
value = (0.5*sum_square(A*x_l2 - b) + gamma*norm(x_l1,1));
end


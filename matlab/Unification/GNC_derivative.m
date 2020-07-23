function [ phi_x ] = GNC_derivative( x, lambda, c )

[m, n] = size(x);
phi_x = zeros(m,n);

lamdba_x_2 = lambda * lambda * (x.*x);

indicator_1 = lamdba_x_2 < c/(1+c);
indicator_2_t = lamdba_x_2 < (1+c)/c;
indicator_2 = (~indicator_1) & indicator_2_t;


phi_x(indicator_1) = 2 * lambda*lambda * x(indicator_1);
phi_x(indicator_2) = 2*lambda*sign(x(indicator_2))*sqrt(c*(1+c)) - c*(lambda*x(indicator_2));

end


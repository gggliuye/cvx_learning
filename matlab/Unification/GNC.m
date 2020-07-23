function [ rho_x ] = GNC( x, lambda, c )
% GNC dunction 
% piecewose [plynomal approxmation

[m, n] = size(x);
rho_x = ones(m,n);

lamdba_x_2 = lambda * lambda * (x.*x);

indicator_1 = lamdba_x_2 < c/(1+c);
indicator_2_t = lamdba_x_2 < (1+c)/c;
indicator_2 = (~indicator_1) & indicator_2_t;

rho_x(indicator_1) = lamdba_x_2(indicator_1);
rho_x(indicator_2) = 2*lambda*abs(x(indicator_2))*sqrt(c*(1+c)) - c*(1+lamdba_x_2(indicator_2));

end


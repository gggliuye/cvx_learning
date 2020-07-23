clc; clear;

x = [-10:0.1:10];

% Huber Loss
% sigma = 2.0;
% indicator = abs(x) < sigma;
% rho_x = abs(x);
% rho_x(indicator) = x(indicator).*x(indicator)/(2*sigma) + sigma/2;
% phi_x = sign(x);
% phi_x(indicator) = x(indicator)/sigma;

% Lorentzian Loss
% sigma = 2.0;
% rho_x = log(1+ (1/(2*sigma*sigma))*(x.*x) );
% phi_x = 2*x./ ((2*sigma*sigma)+(x.*x));

% Truncated Loss
% beta = 16.0;
% indicator = abs(x) > sqrt(beta);
% rho_x = x.*x;
% rho_x(indicator) = beta;
% phi_x = 2 *x;
% phi_x(indicator) = 0;

% GNC
lambda = 0.5;
c = 0.5;

rho_x = GNC(x, lambda, c);
phi_x = GNC_derivative(x,lambda,c);

figure(1);
set(gcf,'position',[1000,400,600,250])
subplot(121);
plot(x,rho_x);
title('GNC rho');

subplot(122);
plot(x,phi_x);
title('GNC phi');

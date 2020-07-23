clc; clear;

x = [-5:0.1:5];

% GNC
lambda = 0.5;
c = 0.5;

z = [0:0.02:1];
phi_z = c*(1-z)./(c+z);

z_s = [0.0, 0.2, 0.4, 0.6 0.8 1.0];
E_x = [];
for i = 1 : 6
    z_choice = z(i);
    E_x_t = lambda * lambda * (x.*x).*z_choice + c*(1-z_choice)/(c+z_choice);
    E_x = [E_x; E_x_t];
end

figure(1);
set(gcf,'position',[1000,400,600,250])
subplot(121);
plot(z,phi_z);
title('GNC Phi z');

subplot(122);
for i = 1 : 6
    plot(x,E_x(i,:));
    hold on;
end
title('GNC Energy x');
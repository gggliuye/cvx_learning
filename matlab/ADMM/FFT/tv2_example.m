clc;clear;

n = 50;
step = 3;
magnitude_step = 20;

x_init = zeros(n,n);
interval = floor(n/2/step);

for i = 1:step-1
    x_init(interval*i:n-interval*i,interval*i:n-interval*i) = magnitude_step * i;
end

%mesh(x_init)

noise = (rand(n,n)-0.5) * 5;

x_noise = x_init + noise;
%mesh(x_noise)

lambda = 5;
H = speye(n);
t_start = tic;
[x_x history] = total_variation_2d(x_noise, H, lambda, 1.0);
[x_y history] = total_variation_2d(x_x', H, lambda, 1.0);
toc(t_start);

x = x_y';

g = figure(2);
subplot(131);
mesh(x_init);
title('Original data');
axis tight


subplot(132);
mesh(x_noise);
title('Noised data');
axis tight

subplot(133);
mesh(x);
title('Reconstructed data');
axis tight


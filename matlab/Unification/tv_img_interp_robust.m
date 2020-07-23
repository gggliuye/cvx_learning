% tv_img_interp.m
% Total variation image interpolation.
% Defines m, n, Uorig, Known.

clc; clear;

TestImage;

[m, n] = size(Uorig);

% Create mask of known pixels.
rand('state', 1029);
Known = rand(m,n) > 0.010;

%%%%% Put your solution code here

% Calculate and define Ul2 and Utv.

% Placeholder:
Ul2 = ones(m, n);
Utv = ones(m, n);
Ulp = ones(m, n);

gamma = 0.9;
t_start = tic;
cvx_begin quiet
    variable Ul2(m, n);
    %Ul2(Known) == Uorig(Known); % Fix known pixel values.
    Ux = Ul2(2:end,2:end) - Ul2(2:end,1:end-1); % x (horiz) differences
    Uy = Ul2(2:end,2:end) - Ul2(1:end-1,2:end); % y (vert) differences
    minimize(norm([Ux(:); Uy(:)], 2) + gamma*norm(Ul2(Known)-Unoise(Known),2)); % l2 roughness measure
cvx_end
toc(t_start);

t_start = tic;
gamma = 9;
cvx_begin quiet
    variable Ulp(m, n);
    %Ul2(Known) == Uorig(Known); % Fix known pixel values.
    Ux = Ulp(2:end,2:end) - Ulp(2:end,1:end-1); % x (horiz) differences
    Uy = Ulp(2:end,2:end) - Ulp(1:end-1,2:end); % y (vert) differences
    minimize(sum(huber([Ux(:); Uy(:)], 0.5)) + gamma*norm(Ulp(Known)-Unoise(Known),2)); % l2 roughness measure
cvx_end
toc(t_start);

t_start = tic;
gamma = 20;
cvx_begin quiet
    variable Utv(m, n);
    Ux = Utv(2:end,2:end) - Utv(2:end,1:end-1); % x (horiz) differences
    Uy = Utv(2:end,2:end) - Utv(1:end-1,2:end); % y (vert) differences
    minimize(norm([Ux(:); Uy(:)], 1) + gamma*norm(Utv(Known)-Unoise(Known),2)); % tv roughness measure
cvx_end
toc(t_start);
%%%%%

% Graph everything.
figure(1); cla;
%colormap gray;

subplot(241);
imagesc(Unoise)
title('Original image');
axis image;

% subplot(234);
% imagesc(Known.*Unoise + 256-150*Known);
% title('Obscured image');
% axis image;

subplot(245)
mesh(Unoise);
title('Original mesh');
axis tight

subplot(242);
imagesc(Ul2);
title('l_2 reconstructed image');
axis image;

subplot(246)
mesh(Ul2);
title('l_2 reconstructed mesh');
axis tight

subplot(243);
imagesc(Utv);
title('Total variation reconstructed image');
axis image;

subplot(247)
mesh(Utv);
title('Total variation reconstructed mesh');
axis tight

subplot(244);
imagesc(Ulp);
title('Huber Loss image');
axis image;

subplot(248)
mesh(Ulp);
title('Huber Loss mesh');
axis tight

m = 50;
n = 50;
num_layer = 3;
num_max = 250;

Uorig = zeros(m,n);

% make a three layers pyramid

m_layer = floor(m/num_layer/2);
n_layer = floor(m/num_layer/2);
interval = floor(num_max/num_layer);

for i = 1 : num_layer-1
    start_id = [m_layer*i , n_layer*i];
    end_id = [m,n] - start_id;
    Uorig(start_id(1):end_id(1),start_id(2):end_id(2)) = interval*i;
end

noise_magnitude = 20;
noise = rand(m,n) * noise_magnitude;

Unoise = Uorig + noise;

% figure(1)
% set(gcf,'position',[1000,400,700,300])
% subplot(1,2,1)
% mesh(Uorig);
% axis tight
% 
% subplot(1,2,2)
% mesh(Unoise);
% axis tight
%colormap gray;


clear noise noise_magnitude m_layer n_layer;
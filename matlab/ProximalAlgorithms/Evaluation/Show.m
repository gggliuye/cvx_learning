

%%%%%%%%%% show the proximal operator of l2 norm %%%%%%%%%%%%%%%%%%%%
%%% show the magitude of proximal operator of l2 norm in R2 space %%%
clear;

lambda = 1.0;
n = 30;
z = zeros(n);

for i = 1:n
    for j = 1:n
        v = [i/10,j/10] - [n/20, n/20];
        z(i,j) = norm(prox_l2(v, lambda),2); 
    end
end

h=surf(z);
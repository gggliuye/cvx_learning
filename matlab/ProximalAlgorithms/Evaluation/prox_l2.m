function [ x ] = prox_l2( v, lambda )
[m, n] = size(v);
norm_v = norm(v,2);
if norm_v <= lambda
    x = zeros(m, n);
else
    x = (1 - (lambda/norm_v))* v;
end

end


function [ Vout ] = prox_matrix(X, eta, prox_l1)

[U,S,V] = svd(X);    %  X= U*S*V'
Spos = prox_l1(S, eta);
Vout = U * Spos * V';

end


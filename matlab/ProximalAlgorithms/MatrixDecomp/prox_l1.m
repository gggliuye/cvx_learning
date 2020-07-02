function [ z ] = prox_l1( x, lambda_L)
  a = x - lambda_L;
  b = -x - lambda_L;
  z = subplus(a) - subplus(b);
end


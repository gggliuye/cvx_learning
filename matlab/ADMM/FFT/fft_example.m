n = 5;
w = rand(n,1);

C_w = real(dft(n,n) * diag(dft(n,n)*w) * idft(n,n));

D_w = dft(n,n) * C_w * idft(n,n);

D_w % D_w = diag(conjuage(fft(w)));
 



function D=dft(K,N)
    D = zeros(N,K);
    WN=exp(-j*2*pi/N);
    for n = 1:N
        for k = 1:K
            D(n,k) = WN^((n-1)*(k-1));
        end
    end
    
end
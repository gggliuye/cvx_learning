function D=idft(K,N)
    D = zeros(K,N);
    WN=exp(j*2*pi/N);
    for n = 1:N
        for k = 1:K
            D(k,n) = WN^((n-1)*(k-1))/ K;
        end
    end
    
end
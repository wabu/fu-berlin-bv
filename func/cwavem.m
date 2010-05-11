function M = cwavem(N)
    E = eye(N);
    T = zeros(N);
    
    layers = log2(N);

    for x=1:N
        T(:,x) = hwl_inv(E(x,:),layers).';
    end

    M = T;

end

function X = haarlet(n) 
    X = zeros(n,n);
    X(1,:) = ones(1,n);
    x = 1
    y = 2
    while x<n
        len = n/x;
        for off = 0:len:n-1
            base = zeros(1,n);
            for o=1:len/2
                base(off+o) = 1*x;
            end
            for o=1+len/2:len
                base(off+o) = -1*x;
            end
            X(y++,:) = base;
        end
        x = x*2;
    end
    X = X/n;
end

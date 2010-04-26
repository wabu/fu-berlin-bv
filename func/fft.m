function y = fft(x)
    [n _] = size(x);
    if n == 1
        y = x;
    else
        m = n/2;

        P = fft(x(1:2:n, 1:2:n));
        Q = fft(x(1:2:n, 2:2:n));
        R = fft(x(2:2:n, 1:2:n));
        S = fft(x(2:2:n, 2:2:n));
        
        w1 = exp(-2 * pi * i / n) .^ (0:m-1);
        v = w1' * ones(1,m);
        w = ones(1,m)' * w1;

        P_ =      P;
        R_ = v .* R;
        Q_ =      Q .* w;
        S_ = v .* S .* w;

        y = [ P_ + R_ + Q_ + S_ , P_ + R_ - Q_ - S_ ;
              P_ - R_ + Q_ - S_ , P_ - R_ - Q_ + S_ ];
    end
end


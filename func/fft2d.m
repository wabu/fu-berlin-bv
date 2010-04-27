function y = fft2d(x)
    [n _] = size(x);
    if n == 1
        y = x;
    else
        m = n/2;

        if n > 100
            printf('+ %d ', n)
            toc()
        end

        P = fft2d(x(1:2:n, 1:2:n));
        Q = fft2d(x(1:2:n, 2:2:n));
        R = fft2d(x(2:2:n, 1:2:n));
        S = fft2d(x(2:2:n, 2:2:n));

        if n > 100
            printf('- %d ', n)
            toc()
        end

        
        w1 = exp(-2 * pi * i / n) .^ (0:m-1);
        w = ones(m,1) * w1;
        v = w';

        P_ =      P;
        R_ = v .* R;
        Q_ =      Q .* w;
        S_ = v .* S .* w;

        y = [ P_ + R_ + Q_ + S_ , P_ + R_ - Q_ - S_ ;
              P_ - R_ + Q_ - S_ , P_ - R_ - Q_ + S_ ];
    end
end


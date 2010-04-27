function y = ffc(x)
    [c n] = size(x);
    if n == 1
        y = x;
    else
        m = n/2;

        a = ffc(x(:, 1:2:n));
        b = ffc(x(:, 2:2:n));
        
        w = exp(2 * pi * i / n) .^ (0:m-1);
        w_= ones(c,1) * w;
        b_= w_ .* b;

        y = [ a + b_ , a - b_ ];
    end
end


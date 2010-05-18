function y = cdf22(x)
    [_,n] = size(x);

    if n == 1
        y = x;
        return;
    end

    gerade   = x(:, 2:2:n);
    ungerade = x(:, 1:2:n);

    p = 0.5 * (gerade + zeroshift(gerade));

    d = ungerade - p;

    u = 0.25 * (d + zeroshift(d));

    y_ = cdf22(gerade + u);

    y = [y_, d];
end

function s = zeroshift(x)
    [m,n] = size(x);
    s = [zeros(m,1), x(:, 1:n-1)];
end

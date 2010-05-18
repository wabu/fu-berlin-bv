function y = cdf22i(x)
    y = cdf22i(x, 1);
end

function y = cdf22i(x, i)
    [_,n] = size(x);
    if i == n
        y = x;
        return
    end

    s = x(:, 1:i);
    d = x(:, i+1:2*i);

    u = 0.25*(d + zeroshift(d));
    gerade = s - u;

    p = 0.5 * (gerade + zeroshift(gerade));
    ungerade = d + p;

    x(:, 1:2:2*i) = ungerade;
    x(:, 2:2:2*i) = gerade;

    y = cdf22i(x, 2*i);
end

function s = zeroshift(x)
    [m,n] = size(x);
    s = [zeros(m,1), x(:, 1:n-1)];
end

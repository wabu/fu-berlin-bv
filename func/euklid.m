function d = euklid(a,b)
    [n,m] = size(a);
    d = 0;
    for x = 1:n
        for y = 1:n
            f = a(x,y) - b(x,y);
            d += f*f;
        end
    end
    d = sqrt(d);
end

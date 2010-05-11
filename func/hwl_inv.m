function Z= hwl_inv(vector, layer)
    if layer==0
        Z = vector;
        return;
    end

    n = length(vector);
    i = 2^layer;
    m = n/i;

    temp = vector;

    for x=1:m
        temp(2*x-1) = vector(x) + vector(m+x);
        temp(2*x) = vector(x) - vector(m+x);
    end

    Z = hwl_inv(temp, layer-1);
end

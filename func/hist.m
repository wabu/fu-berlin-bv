function h = hist(X, m)
    [x,y] = size(X);
    h = zeros(1,m);
    for i = 1:x
        for j = 1:y
            foo = X(i,j)+1;
            h(foo) += 1;
        end
    end
    h /= x*y;
end

function d = kvdiv(p,q)
    [n m] = size(p);
    d = 0;
    for i=1:n
        for j=1:m
            if (p(i,j)!=0) && (q(i,j)!=0)
                d += p(i,j) * log(p(i,j)/q(i,j));
            end
        end
    end
end

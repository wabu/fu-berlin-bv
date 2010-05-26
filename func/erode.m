function Y = erode(X)
    [x,y] = size(X);
    Y = zeros(x-2, y-2);
    kern = [ 0 1 0
             1 1 1
             0 1 0 ];
    for i=1:x-2
        for j=1:y-2
            sel = or(not(kern),X(i:i+2, j:j+2));
            Y(i,j) = all(all(sel));
        end
    end
end

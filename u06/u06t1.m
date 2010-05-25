
I1 = loadimage('lena1.bmp');
I2 = loadimage('lena2.bmp');
I3 = loadimage('lena3.bmp');

h1 = hist(I1,256);
h2 = hist(I2,256);
h3 = hist(I3,256);

c1 = cumsum(h1);
c2 = cumsum(h2);
c3 = cumsum(h3);

function m = minx(h);
    for x = 1:length(h)
        if h(x) > 0
            m = x;
            return
        end
    end
end
function Y = equalize(X, cdf, u)
    m = cdf(minx(cdf));
    [x,y] = size(X);

    Y = zeros(size(X));
    for i=1:x
        for j=1:y
            x = X(i,j)+1;
            Y(i,j) = (cdf(x) - m)/(1 - m);
        end
    end
end

plot(h1, '1');
hold on
plot(h2, '2');
plot(h3, '3');
hold off

Y1 = equalize(I1, c1, 256);
Y2 = equalize(I2, c2, 256);
Y3 = equalize(I3, c3, 256);

imwrite([Y1,Y2,Y3], "u06/task1-eq.png");




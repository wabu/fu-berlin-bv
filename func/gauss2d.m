function z = gauss2d( x, y, sigma)
    z = 1/(2*pi*sigma^2)*exp(-0.5*(x^2/sigma^2+y^2/sigma^2));
end

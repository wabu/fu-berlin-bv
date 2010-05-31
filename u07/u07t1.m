I = loadimageprompt();

[sx,sy] = size(I);
hx = sx/2;
hy = sy/2;

H = zeros(hx,hy);

for x=1:hx
    for y=1:hy
        H(x,y) = sum(sum( I(x*2-1:x*2, y*2-1:y*2) ))/4;
    end
end

R = zeros(sx,sy);

for x=1:hx-1
    for y=1:hy-1
        a = H(x  ,y  )/16;
        b = H(x+1,y  )/16;
        c = H(x+1,y+1)/16;
        d = H(x  ,y+1)/16;

        x2 = x*2;
        y2 = y*2;

        R(x2-1,y2-1) = 9*a + 3*b + 3*c + 1*d;
        R(x2  ,y2-1) = 3*a + 9*b + 3*c + 1*d;
        R(x2  ,y2  ) = 3*a + 3*b + 9*c + 1*d;
        R(x2-1,y2  ) = 1*a + 3*b + 3*c + 9*d;
    end
end


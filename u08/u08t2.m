I = double(loadimage("goal.jpg"));
H = rgb2hsv(I);

[sx,sy,sz] = size(I);

r=174;
g=77;
b=96;
rv = [r g b];

h=0.9666;
s=0.56;
v=0.68;
hv = [h s v];


function d=dist(a,b)
    c = a-b;
    c = c.*c;
    d = sqrt(sum(c));
end

d=75
for x=1:sx
    for y=1:sy
        if dist([I(x,y,1) I(x,y,2) I(x,y,3)], rv) < d
            I(x,y,:) = rv;
        end
    end
end
imwrite(I/256, 'u08/dist_rgb.png');

I = double(loadimage("goal.jpg"));
h=0.2
for x=1:sx
    for y=1:sy
        if dist([H(x,y,1) H(x,y,2)], hv(1:2)) < h
            I(x,y,:) = rv;
        end
    end
end
imwrite(I/256, 'u08/dist_hsv.png');



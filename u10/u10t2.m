I = loadimage('moon.bmp');

[rows,cols] = size(I);

m = rows/2;
K = zeros(rows);

%R = normrnd(0,1,rows);
%imwrite([I, uint8(128+trans), uint8(out)], "u05/task2.png");

% noise reduction
%G = gaussmatrix(rows,1);
%G = shift(shift(G,-m),-m,2);
%If = conv(G, double(I));

% ableitung
Sobel_x = [1 0 -1;
           2 0 -2;
           1 0 -1];
K(1:3, 1:3) = Sobel_x;
K_sx = shift(shift(K,-1),-1,2);
K_sy = -1*K_sx';

Ix = real(conv(K_sx, double(I)));
Iy = real(conv(K_sy, double(I)));

[theta,r] = cart2pol(Ix,Iy);

B = zeros(rows,cols);
th = 120;
for x=1:rows
    for y=1:cols
        if r(x,y) > th
            B(x,y) = 1;
        end
    end
end

dt = 0.2;

min_r = 3;
max_r = 20;
diff_r = max_r - min_r;
rs = [3,5,10,20];
min_x = 1;
max_x = cols;
diff_x = max_x - min_x;
min_y = 1;
max_y = rows;
diff_y = max_y - min_y;

res = 400;
M = zeros(res, res, diff_r+1);
mark = zeros(res, res);
m=0;

for x=1:rows
for y=1:cols
if B(x,y)
    for r=rs
    m++;
    for t=-pi:(pi/(r*2)):pi
        dx = r*cos(t);
        dy = r*sin(t);
        x_ = ceil(((x+dx)-min_x)/diff_x*res);
        y_ = ceil(((y+dy)-min_y)/diff_y*res);
        r_ = r - min_r +1;
        % avoid hitting a pixel twice in a single rendering
        if( mark(x_,y_)!=m )
            M(x_, y_, r_) += 1;
            mark(x_,y_)=m;
        end
    end
    end
end
end
end

imshow(M(:,:,1)/100);
imshow(M(:,:,3)/100);
imshow(M(:,:,5)/100);
imshow(M(:,:,10)/100);
imshow(M(:,:,15)/100);
imshow(M(:,:,20)/100);
imshow(M(:,:,30)/100);
imshow(M(:,:,40)/100);
imshow(M(:,:,50)/100);

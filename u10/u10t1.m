I = loadimage('street.bmp');

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
th = 100;
for x=1:rows
    for y=1:cols
        if r(x,y) > th
            B(x,y) = 1;
        end
    end
end

dt = 0.2;

min_t = -pi;
max_t = pi;
diff_t = max_t - min_t;
min_d = 0;
max_d = 1000;
diff_d = max_d - min_d;

res = 300;
M = zeros(res, res);
M(1:20,1:5) = ones(20,5);
for x=1:rows
    for y=1:cols
        if B(x,y)
            for t=theta(x,y)-pi/2:pi:theta(x,y)+pi/2
            for a=(t-dt):(diff_t/res):(t+dt)
                d = x * cos(a) + y * sin(a);
                if (d<0)
                    d = -d;
                    a = a + pi;
                end

                if (a>pi)
                    a -= 2*pi;
                end
                if (a<-pi)
                    a+= 2*pi;
                end

                mx = ceil((a-min_t)/diff_t*res);
                my = ceil((d-min_d)/diff_d*res);
                M(mx,my) += 1;
            end
            end
        end
    end
end
imshow(M/1000);


I1 = loadimage('banana.bmp');
I2 = loadimage('banana2.bmp');
I3 = loadimage('lenna512.bmp');

[rows,cols] = size(I1);
    global T
    global theta
    global k

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

I1x = real(conv(K_sx, double(I1)));
I1y = real(conv(K_sy, double(I1)));
I2x = real(conv(K_sx, double(I2)));
I2y = real(conv(K_sy, double(I2)));
I3x = real(conv(K_sx, double(I3)));
I3y = real(conv(K_sy, double(I3)));

x1 = zeros(rows/16, cols/16);
y1 = zeros(rows/16, cols/16);
x2 = zeros(rows/16, cols/16);
y2 = zeros(rows/16, cols/16);
x3 = zeros(rows/16, cols/16);
y3 = zeros(rows/16, cols/16);

for x=1:rows
    for y=1:cols
        i = ceil(x/16);
        j = ceil(y/16);
        x1(i,j) += I1x(x,y);
        y1(i,j) += I1y(x,y);
        x2(i,j) += I2x(x,y);
        y2(i,j) += I2y(x,y);
        x3(i,j) += I3x(x,y);
        y3(i,j) += I3y(x,y);
    end
end
x1 /= 16*16;
y1 /= 16*16;
x2 /= 16*16;
y2 /= 16*16;
x3 /= 16*16;
y3 /= 16*16;

[theta1,r1] = cart2pol(x1,y1);
[theta2,r2] = cart2pol(x2,y2);
[theta3,r3] = cart2pol(x3,y3);

T1 = round(theta1*180/pi)+180;
T2 = round(theta2*180/pi)+180;
T3 = round(theta3*180/pi)+180;

h1 = hist(T1, 361);
h2 = hist(T2, 361);
h3 = hist(T3, 361);

E = euklid(h1,h2)
K = kvdiv(h1,h2)

D = 0;
d = 0;
[a,b] = size(x1);
for x=1:a
    for y=1:b
        D += abs(theta1(x,y) - theta2(x,y));
        d += abs(theta1(x,y) - theta3(x,y));
    end
end
D /= a*b;
d /= a*b;


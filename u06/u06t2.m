I = loadimageprompt();

[rows,cols] = size(I);
    global T
    global theta
    global k

m = rows/2;
K = zeros(rows);

R = normrnd(0,1,rows);
%imwrite([I, uint8(128+trans), uint8(out)], "u05/task2.png");

% noise reduction
G = gaussmatrix(rows,1);
G = shift(shift(G,-m),-m,2);
If = conv(G, double(I));

% ableitung
Sobel_x = [1 0 -1;
           2 0 -2;
           1 0 -1];
K(1:3, 1:3) = Sobel_x;
K_sx = shift(shift(K,-1),-1,2);
K_sy = -1*K_sx';

Ix = real(conv(K_sx, double(If)));
Iy = real(conv(K_sy, double(If)));

[theta,r] = cart2pol(Ix,Iy);
theta = mod(round(theta*4/pi),4);

% Non-maxima suppression
k = r;
for x=2:rows-1
    for y=2:cols-1
        dir = theta(x,y);
        local = r(x-1:x+1, y-1:y+1);
        if dir == 0
            local(1,2) = 0;
            local(3,2) = 0;
        elseif dir == 1
            local(1,1) = 0;
            local(3,3) = 0;
        elseif dir == 2
            local(2,1) = 0;
            local(2,3) = 0;
        elseif dir == 3
            local(3,1) = 0;
            local(1,3) = 0;
        end
        if max(max(local)) != r(x,y)
            k(x,y) = 0;
        end
    end
end


maxtres = 90;

T = zeros(rows,cols);
function track(x,y)
    mintres = 30;
    global T
    global k
    global theta
    [rows, cols] = size(T);
    if x<=0 || y<=0 || x > rows || y > cols
        return
    end
    if T(x,y)
        return
    end

    if k(x,y) > mintres
        T(x,y) = 1;
        dir = theta(x,y);
        if dir == 0
            track(x+1,y);
            track(x-1,y);
        elseif dir == 1
            track(x+1,y+1);
            track(x-1,y-1);
        elseif dir == 2
            track(x,y-1);
            track(x,y+1);
        elseif dir == 3
            track(x+1,y-1);
            track(x-1,y+1);
        end
    end
end

% thresholding and tracking
for x=1:rows
    for y=1:cols
        dir = theta(x,y);
        if k(x,y) > maxtres
            track(x,y);
        end
    end
end


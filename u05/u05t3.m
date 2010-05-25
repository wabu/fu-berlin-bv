printf('-- u05 task3 - EM deconv (lucy)\n');

I = loadimageprompt();

[rows,cols] = size(I);

if rows != cols && mod(cols,2)!=0
    printf('unsupported image size [%d,%d]\n',rows, cols);
    return;
end
n = rows;

K_uni = zeros(rows);
K_uni(1:5,1:5) = 0.04;
K_uni = shift(shift(K_uni,-2), -2,2);

If = real(conv(K_uni, double(I)));

H = If;
W = ones(rows,cols);
W_ = ones(rows,cols);

%function j=m(i)
%    n = 512;
%    j = mod((i-1),n)+1;
%end
%
%for x=1:n
%    for y=1:n
%        z = 0;
%        for kx=-2:2
%            for ky=-2:2
%                s = 0;
%                for jx=-2:2
%                    for jy=-2:2
%                        s = s + 0.04 * W(mn(x+kx+jx), mn(y+ky+jy));
%                    end
%                end
%                z = z + 0.04 * H(mn(x+kx),mn(y+ky)) / s;
%            end
%        end
%        W_(x,y) = W(x,y) * z;
%    end
%end
%W(:,:) = W_;

for i=1:5
    W = W.*conv(K_uni, H./conv(K_uni, W));
end

imwrite([I, uint8(real(If)), uint8(real(W))], "u05/task3.png");


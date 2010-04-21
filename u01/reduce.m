# matrix M and percentage factor
function matrix = reduce(M, factor)
    [rows, cols] = size(M);
    M_abs = abs(M);
    elMax = max(max(M_abs));
    elMin = min(min(M_abs));
    thold = elMin + (elMax-elMin)*factor;
    thold = 30;
    i = 0;
    matrix = M;
    for row=1:rows
        for col=1:cols
	   if M_abs(col,row) < thold
	      matrix(col,row) = 0;
	      i++;
	   end
	end
    end
    printf('thold %.2f affected %d/%d elements\n', thold, i,rows*cols);
end

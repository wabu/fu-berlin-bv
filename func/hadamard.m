function matrix = hadamard(dim)
    printf('dim is %d\n', dim)
    if dim <= 1
        matrix = [1];
    else
        if mod(dim,2) != 0
            printf ('unsupported dimension\n');
        else
            m=hadamard(dim/2);
	    matrix=[m,m;m,-m];
        end
    end
end



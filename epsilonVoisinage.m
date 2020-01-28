function neighboursI = epsilonVoisinage(X, Y, i, eps)
    neighboursI = [];
    n = length(X);
    assert(n == length(Y));
    for j = 1 : n
        if((X(i) - X(j))^2 + (Y(i) - Y(j))^2 < eps^2)
            neighboursI = [j neighboursI];
        endif
    endfor
endfunction
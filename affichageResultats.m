function affichageResultats(tags, X, Y)

types = ["+" "o" "*" "." "x" "s" "d" "^" "v" ">" "<" "p" "h"];
colors = ["k" "r" "g" "b" "m" "c" "w"];

for k = 1:length(tags)
    i = rem(tags(k), length(types)) + 1;
    j = mod(tags(k), length(colors)) + 1;
    strcat(types(i), colors(j));
    if tags(k) < 1
        continue;
    endif
    plot(X(k), Y(k), [types(i) colors(j)]);
    hold on;
endfor
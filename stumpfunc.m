function hx = stumpfunc(theta, x)
dir = theta(1);
alpha = theta(2);
dim = theta(3);

hx = sign((x(:, dim) - alpha));
hx = hx + (hx == 0);
hx = dir .* hx;

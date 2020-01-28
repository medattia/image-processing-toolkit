function h = stumplearn(x, y, d)
maxgrad = 0;
for dim=1:size(x, 2)
  xx = x(:, dim);
  xxx = sort(xx);
  alpha = 0.5 * (xxx(1:(length(xx)-1)) + xxx(2:length(xx)));
  alpha = alpha';

  hxa = sign(repmat(xx, 1, length(alpha)) - ...
             repmat(alpha, size(xx, 1), 1));
  hxa = hxa + (hxa == 0);

  grad = sum(repmat(y .* d, 1, length(alpha)) .* hxa);
  
  [best, idx] = max(abs(grad));

  alpha = alpha(idx);
  dir = (grad(idx) >= 0) * 2 - 1;

  if best > maxgrad
    maxalpha = alpha;
    maxdir = dir;
    maxgrad = best;
    maxdim = dim;
  end  
end

h = [];
h(1) = maxdir;
h(2) = maxalpha;
h(3) = maxdim;

hx = stumpfunc(h, x);







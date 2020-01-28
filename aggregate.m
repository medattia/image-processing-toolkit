function [y, mgn] = aggregate(w, h, func, x)
N = size(x, 1);
mgn = zeros(N, 1);
for t=1:length(w)
  if size(h{t}, 1) == 0 || w(t) == 0
    break;
  end  
  mgn = mgn + w(t) * func(h{t}, x);
end
y = sign(mgn) + (mgn == 0);

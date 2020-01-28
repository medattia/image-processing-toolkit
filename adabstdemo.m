function [w, h] = adabstdemo(x, y, T, learn, func, ...
                             finish, drawsymb, pausestep)
N = size(x, 1);
w = zeros(T, 1);
d = ones(N, 1) ./ N;
h = cell(T, 1);
stoptoken = 0;

ispos = (y > 0);
pos = find(ispos);
neg = find(~ispos);

minX = min(x(:, 1));
maxX = max(x(:, 1));
minY = min(x(:, 2));
maxY = max(x(:, 2));

gridX = (maxX - minX) ./ 100;
gridY = (maxY - minY) ./ 100;

minX = minX - 10 * gridX;
maxX = maxX + 10 * gridX;
minY = minY - 10 * gridY;
maxY = maxY + 10 * gridY;

[bigX, bigY] = meshgrid(minX:gridX:maxX, minY:gridY:maxY);
ntest=size(bigX, 1) * size(bigX, 2);
tx=[reshape(bigX, ntest, 1), reshape(bigY, ntest, 1)];

trainerr = [];

for t=1:T
%% Draw   
  clf;
  hold on;
  
  if t > 1
    theta = h{t-1};
    if theta(3) == 1
      if ~finish
        if theta(1) > 0
          fill([theta(2), theta(2), maxX, maxX], ...
               [minY, maxY, maxY, minY], 'y');
        else
          fill([theta(2), theta(2), minX, minX], ...
               [minY, maxY, maxY, minY], 'y');      
        end        
      end              
      H = line([theta(2), theta(2)], [minY, maxY]);
    else
      if ~finish
        if theta(1) > 0
          fill([minX, maxX, maxX, minX], ...
               [theta(2), theta(2), maxY, maxY], 'y');
        else
          fill([minX, maxX, maxX, minX], ...
               [theta(2), theta(2), minY, minY], 'y');
        end        
      end                    
      H = line([minX, maxX], [theta(2), theta(2)]);
    end
    set(H, 'LineStyle', '-.', 'LineWidth', 3, 'Color', [0 0 1])
  end
  
  
  if drawsymb
    for n=1:N
      if y(n) > 0
        symbol = 'o';
      else
        symbol = 'x';
      end
      fontsize = ceil(d(n) * 10 * N) * 2;
      if fontsize > 32
        fontsize = 32;
      end      
      text(x(n, 1), x(n, 2), symbol, 'FontSize', fontsize);
    end
  else
    plot(x(pos, 1), x(pos, 2), 'o');
    plot(x(neg, 1), x(neg, 2), 'x');
  end
  
  [lbl, z] = aggregate(w, h, func, tx);
  bigZ = reshape(z, size(bigX, 1), size(bigX, 2));
  [C, H] = contour(bigX, bigY, bigZ, [0 0]);
  set(H, 'Color', [1 0 0], 'LineWidth', 5)
  
  
  axis([minX maxX minY maxY]);
  drawnow;

  if mod(t-1, pausestep) == 0
    pause;
  end
  
  if stoptoken
    break;
  end

  t
  h{t} = learn(x, y, d);
  hx = func(h{t}, x);
  
  err = sum(((y .* hx) < 0) .* d);
  if err < 1e-10
    T = 1;
    h{T} = h{t};
    w(T) = 1;
    stoptoken = 1;
    continue;
  end  

  w(t) = 0.5 * log((1 - err) ./ err);

  
  d = d .* exp(- (y .* hx) * w(t));
  d = d ./ sum(d);
  
  [yy, mgn] = aggregate(w, h, func, x);  
  trainerr(t) = sum(yy ~= y) ./ N * 100;  
  
  if ~finish && trainerr(t) < 1e-10
    T = t;
    stoptoken = 1;
    continue;
  end  
  
end

w = w(1:T, 1) ./ sum(w);
h = {h{1:T}};



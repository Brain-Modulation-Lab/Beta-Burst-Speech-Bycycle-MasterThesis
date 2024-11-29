function colors = lin_bwr_colormap
% linear blue, white, red colormap

% step colors
bottom = [0 0 0.7];
middle = [1 1 1];
top = [0.7 0 0];

n = 256;
colors = zeros(n, 3);

% first half colors
R = linspace(bottom(1), middle(1), n/2);
G = linspace(bottom(2), middle(2), n/2);
B = linspace(bottom(3), middle(3), n/2);

for i = 1:n/2
  colors(i,:) = [R(i), G(i), B(i)];
end

% second half colors
R = linspace(middle(1), top(1), n/2);
G = linspace(middle(2), top(2), n/2);
B = linspace(middle(3), top(3), n/2);

for i = (n/2+1):n
  colors(i,:) = [R(i-n/2), G(i-n/2), B(i-n/2)];
end

end





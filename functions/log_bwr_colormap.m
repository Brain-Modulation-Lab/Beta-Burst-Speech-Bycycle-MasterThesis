function colors = log_bwr_colormap
% log blue, white, red colormap

% Steps colors
bottom = [0.00005 0.00005 0.7];
middle = [1 1 1];
top = [0.7 0.00005 0.00005];

n = 256;
colors = zeros(n, 3);

% first half colors
R = logspace(log10(bottom(1)), log10(middle(1)), n/2);
G = logspace(log10(bottom(2)), log10(middle(2)), n/2);
B = logspace(log10(bottom(3)), log10(middle(3)), n/2);

for i = 1:n/2
  colors(i,:) = [R(i), G(i), B(i)];
end

% second half colors
R = logspace(log10(middle(1)), log10(top(1)), n/2);
G = logspace(log10(middle(2)), log10(top(2)), n/2);
B = logspace(log10(middle(3)), log10(top(3)), n/2);

for i = (n/2+1):n
  colors(i,:) = [R(i-n/2), G(i-n/2), B(i-n/2)];
end

end





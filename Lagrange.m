clear all
close all
x = [1 2 4 5 6];
y = [3 10 2 20 30];
scatter(x, y, 50, 'r', 'filled');
hold on


n = length(x)
L = ones(n,100);

xi = linspace(x(1), x(5), 100);
z = zeros(1, 100);
   for i = 1:n
      for j = 1:n
         if i ~= j
            L(i, :) = L(i, :).* (xi - x(j))/(x(i) - x(j))
         end
      end
   end
      for i = 1:n
      z = z + y(i) * L(i, :);
   end

plot(xi,z)
grid on;
title('Lagrange interpolation');
clear all
close all

% Data points
x = [1 2 3 4 5];
y = [3 10 2 20 30];

%Polynomial fit--------------------------------------------------------
figure;
hold on;
for N = 1:5
    G(N,:) = [1, x(N), x(N)^2, x(N)^3, x(N)^4];
end
y = y';
m = inv(G)*y;

xi = linspace(x(1), x(5), 20); % Increase the number of points for a smoother curve

for i = 1:20
    G_interp(i, :) = [1, xi(i), xi(i)^2, xi(i)^3, xi(i)^4];
end

yi = G_interp*m;
plot(xi, yi);
scatter(x, y, 50, 'r', 'filled');
%Quadratic spline fit---------------------------------------------------
% Compute the coefficients of the quadratic spline
N = length(x) - 1;
V = zeros(3*N,1);
Z = zeros(length(V), length(V));
j = 1;
f = 1;

for i = 1:2:2*N-1
    Z(i, f:f+2) = [1 x(j) x(j)^2 ];
    V(i) = y(j);
    j = j + 1;
    Z(i+1, f:f+2) = [1 x(j) x(j)^2];
    V(i+1) = y(j);
    f = f + 3;
end

j = 2;
l = 2;
for i = 2*N+1:3*N-1
    Z(i, j:j+1) = [1 2*x(l)];
    Z(i, j+3:j+4) = [-1 -2*x(l)];
    j = j + 3;
    l = l + 1;
end

% Adjust the value of a1 to be zero
Z(3*N, 3) = 1;

% Solve for the coefficients
m = inv(Z)* V;

% Plot the quadratic spline curves
m = reshape(m, 3, N); % Reshape Coeff to a 3xN matrix

for i = 1:N
    xi = linspace(x(i), x(i+1), 100); % Use specific x values
    y_interp = m(1, i)  + m(2, i) * xi + m(3, i)* xi.^2;
    plot(xi, y_interp, 'LineWidth', 2);
end

hold on
%Lagrange Polynomial Interpolation ----------------------------------------
x = [1 2 3 4 5];
y = [3 10 2 20 30];
n = length(x);
L = ones(n,100);

xi = linspace(x(1), x(5), 100);
z = zeros(1, 100);
   for i = 1:n
      for j = 1:n
         if i ~= j
            L(i, :) = L(i, :).* (xi - x(j))/(x(i) - x(j));
         end
      end
   end % Initialize y as a row vector
   for i = 1:n
      z = z + y(i) * L(i, :);
   end
plot(xi,z)
legend('Poly fit','Data points','Spline fit','','','', 'Lagrange fit','Location', 'best')
grid on;
xlim([min(x)-2 max(x)+2]);
ylim([min(y)-5 max(y)+9]);
xlabel('x');
ylabel('y');
title('Polynomial vs Quadratic Spline vs Lagrange fit');
grid on;
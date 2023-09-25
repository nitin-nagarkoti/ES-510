clear all
close all

x = [1 2 3 4 5];
y = [3 10 2 20 30];

figure;
hold on
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

% Adjust the value of c1 to be zero
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

% Plot all interpolated curves at once
legend('Data points','Spline fit','','','','Location', 'best')
grid on;
xlim([min(x)-2 max(x)+2]);
ylim([min(y)-10 max(y)+15]);
xlabel('x');
ylabel('y');
title('Quadratic Spline fit');

% Plot all interpolated curves used to fit the data
figure;
hold on
xi = linspace(x(1), x(end), 100);
y_interp = m(1, :)'  + m(2, :)' * xi + m(3, :)'* xi.^2;
scatter(x, y, 50, 'r', 'filled');
plot(xi, y_interp, 'LineWidth', 2);
legend('Data points','P1(x)','P2(x)','P3(x)','P4(x)','Location', 'best')
xlim([min(x)-2 max(x)+2]);
ylim([min(y)-10 max(y)+15]);
grid on;
title('Polynomials used to fit using quadratic spline');
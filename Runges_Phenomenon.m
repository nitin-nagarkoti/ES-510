clear all
close all

x = linspace(1, 1000, 100);
y = randi(1000, [1, 100]);
figure;
hold on
%scatter(x, y, 50, 'r', 'filled');
N = length(x);
G = zeros(N, 100);  % Initialize G with the correct size

% Calculate the G matrix with a 999-degree polynomial using vectorized operations
for j = 1:100
    G(:, j) = x.^(j - 1);
end

y = y';
m = G \ y;  % Use the backslash operator for more stable solving
xi = linspace(x(1), x(end), 1000);  % Increase the number of points for a smoother curve

% Calculate the interpolated curve for the fitted polynomial
G_interp = zeros(1000, 100);  % Initialize G_interp with the correct size
for j = 1:100
    G_interp(:, j) = xi.^(j - 1);
end

% Use the entire G_interp (matching the size of m)
yi = G_interp * m;

% Plot the fitted curve
plot(xi, yi);
xlabel('x');
ylabel('y');
ylim([0 900])
title('99th Degree Polynomial Fit');
legend('Fitted Curve');
% Parameters
a = 3; % Given parameter
b = 1.33; % Given parameter
x0 = 0; % Start of the domain
xn = (a * b + 1) / (a + b); % End of the domain
y0 = (b - 1) / (2 * b); % Initial condition
N =20; % Number of intervals

% Step size
h = (xn - x0) / N;

% Define the exact solution for comparison
exact_solution = @(x) a * x.^2 + b * x + y0; 

% Define the ODE function
f = @(x, y) 2 * a * x + b;

% Modified Four-Stage RK method
% Coefficients (Modify as required)
c = [0.25, 0.15, 0.35, 0.25];        % Weights
theta = [0.2, 0.4, 0.6, 0.8];     % Locations
w = [0, 0.5, 0.5, 1];       % Slope weights

% Initialize variables
x = linspace(x0, xn, N+1);
y = zeros(1, N+1);
y(1) = y0;

% RK method loop
for i = 1:N
    k = zeros(1, 4); % Initialize slopes
    k(1) = h * f(x(i), y(i));
    for m = 2:4
        k(m) = h * f(x(i) + theta(m) * h, y(i) + w(m) * k(m-1));
    end
    y(i+1) = y(i) + sum(c .* k);
end

% Exact solution at computed points
y_exact = exact_solution(x);

% Compute error
error = abs(y - y_exact);

% Plotting
figure;
plot(x, y, '-o', 'DisplayName', 'Numerical Solution');
hold on;
plot(x, y_exact, '-r', 'DisplayName', 'Exact Solution');
xlabel('x');
ylabel('y');
title('Numerical vs Exact Solution');
legend;
grid on;

% Scalability test for RMSE
h_values = [h, h/2, h/4, h/8, h/16];
rmse = zeros(size(h_values));

for idx = 1:length(h_values)
    h_test = h_values(idx);
    N_test = ceil((xn - x0) / h_test);
    x_test = linspace(x0, xn, N_test+1);
    y_test = zeros(1, N_test+1);
    y_test(1) = y0;
    
    for i = 1:N_test
        k = zeros(1, 4);
        k(1) = h_test * f(x_test(i), y_test(i));
        for m = 2:4
            k(m) = h_test * f(x_test(i) + theta(m) * h_test, y_test(i) + w(m) * k(m-1));
        end
        y_test(i+1) = y_test(i) + sum(c .* k);
    end
    
    % Exact solution and RMSE computation
    y_exact_test = exact_solution(x_test);
    rmse(idx) = sqrt(mean((y_test - y_exact_test).^2));
end

% Plot RMSE vs h
figure;
plot(h_values, rmse, '-o');
xlabel('Step Size (h)');
ylabel('Root Mean Square Error (RMSE)');
title('RMSE vs Step Size');
grid on

disp (h_values)
disp (rmse)
disp (h)
disp (xn)
disp(k)

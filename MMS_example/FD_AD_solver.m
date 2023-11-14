% Parameters
MS = true;

Lx = 10.0;  % Domain size in x-direction
Ly = 10.0;  % Domain size in y-direction
Nx = 20;    % Number of grid points in x-direction
Ny = 20;    % Number of grid points in y-direction
Dt = 0.001; % Time step
T_end = 0.005; % End time
D = 1;   % Diffusion coefficient
U = 1.0;    % Advection velocity in x-direction
V = 0.5;    % Advection velocity in y-direction

% Spatial grid
dx = Lx / (Nx - 1);
dy = Ly / (Ny - 1);
x = linspace(0, Lx, Nx);
y = linspace(0, Ly, Ny);
[X, Y] = meshgrid(x, y);

c = my_initialiser(X,Y,Lx,Ly,MS);

figure(1);
surf(X, Y, c, 'EdgeColor', 'none');
title('2D Advection-Diffusion Equation');
xlabel('X-axis');
ylabel('Y-axis');
zlabel('Concentration (c)');
view(2)

% Set boundary conditions
c(:,1) = 0;    % Left boundary
c(:,end) = 0;  % Right boundary
c(1,:) = 0;    % Bottom boundary
c(end,:) = 0;  % Top boundary

tic;
% Time-stepping loop
time = 0;
while time < T_end
    % Compute spatial derivatives using central differencing
    dcdx = (circshift(c, [0, -1]) - 2*c + circshift(c, [0, 1])) / (dx^2);
    dcdy = (circshift(c, [-1, 0]) - 2*c + circshift(c, [1, 0])) / (dy^2);

    % Advection term
    adv_x = U * (circshift(c, [0, -1]) - circshift(c, [0, 1])) / (2 * dx);
    adv_y = V * (circshift(c, [-1, 0]) - circshift(c, [1, 0])) / (2 * dy);

    % Update concentration using explicit finite difference
    my_source = source_term(X,Y,time,D,U,V,Lx,Ly,MS);
    c = c + Dt * (D * (dcdx + dcdy) + my_source - adv_x - adv_y);

    % Set boundary conditions at each time step
    c(:,1) = 0;    % Left boundary
    c(:,end) = 0;  % Right boundary
    c(1,:) = 0;    % Bottom boundary
    c(end,:) = 0;  % Top boundary

    % Update time
    time = time + Dt;
end
toc

% Plot the final concentration field
figure(2);
surf(X, Y, c, 'EdgeColor', 'none');
title('2D Advection-Diffusion Equation');
xlabel('X-axis');
ylabel('Y-axis');
zlabel('Concentration (c)');
view(2)

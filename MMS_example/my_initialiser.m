function c = my_initialiser(X,Y,Lx,Ly,MS)

if MS == false
    % Initialize concentration field with a 2D Gaussian distribution
    mu = [Lx/2, Ly/2];         % Mean of the Gaussian
    sigma = [Lx/10, Ly/10];      % Standard deviation of the Gaussian
    c = exp(-((X - mu(1)).^2 / (2 * sigma(1)^2) + (Y - mu(2)).^2 / (2 * sigma(2)^2)));
else
    % manufactured solution initialisation
    t = 0;
    k_x = pi/Lx;
    k_y = pi/Ly;
    c = sin(k_x*X).*sin(k_y*Y)*t^2;
end
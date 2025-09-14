function [t, Y] = integrate_reduced_system(R, y0, T_final, dt)
% INTEGRATE_REDUCED_SYSTEM Time integration in reduced space
%
% Integrates the reduced dynamical system using explicit Euler method:
%   dy/dt = R*y
%
% INPUTS:
%   R       - Reduced operator matrix
%   y0      - Initial condition in reduced space
%   T_final - Final integration time
%   dt      - Time step size [default: adaptive]
%
% OUTPUTS:
%   t - Time vector
%   Y - Solution matrix (each row is solution at time t(i))

if nargin < 4
    % Choose stable time step based on spectral radius
    max_eigenval = max(real(eig(R)));
    if max_eigenval > 0
        dt = 0.1 / max_eigenval;  % Conservative choice
    else
        dt = 0.01;  % Default small step
    end
end

fprintf('[integrate_reduced_system] Starting time integration...\n');
fprintf('                           Final time: %.2f\n', T_final);
fprintf('                           Time step: %.2e\n', dt);

% Initialize time vector and solution array
t = 0:dt:T_final;
n_steps = length(t);
Y = zeros(n_steps, length(y0));

% Set initial condition
Y(1, :) = y0';

% Explicit Euler time stepping
for i = 1:n_steps-1
    Y(i+1, :) = Y(i, :) + dt * (R * Y(i, :)')';
end

fprintf('[integrate_reduced_system] Integration completed: %d steps\n', n_steps);

end

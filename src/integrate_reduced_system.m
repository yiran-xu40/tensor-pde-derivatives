function [T_hist, Xtilde_hist] = integrate_reduced_system(R, X0_tilde, T_final, dt)
[r5, r6] = size(X0_tilde);
x = X0_tilde(:);
K = floor(T_final/dt) + 1;
T_hist = zeros(K,1);
Xtilde_hist = zeros(r5, r6, K);
Xtilde_hist(:,:,1) = X0_tilde;
k = 1; T = 0;
while T < T_final - 1e-12
    dx = R * x;
    x  = x + dt * dx;
    T  = T + dt;
    k = k + 1;
    T_hist(k) = T;
    Xtilde_hist(:,:,k) = reshape(x, r5, r6);
end
T_hist = T_hist(1:k);
Xtilde_hist = Xtilde_hist(:,:,1:k);
end

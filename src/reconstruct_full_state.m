function X_full = reconstruct_full_state(U5, U6, X_tilde)
X_full = U5 * X_tilde * U6';
end

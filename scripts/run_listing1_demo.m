function run_listing1_demo()
setup(); utils.fix_rng(20250910);
n = 6; r5 = 3; r6 = 3; T_final = 1.0;
A  = gen6ordersparsetensor(0.01, 20250910);
X0 = randn(n,n);
[G, U5, U6] = tucker_reduce_modes56(A, r5, r6); %#ok<NASGU>
X0_tilde = U5' * X0 * U6;
R = build_reduced_operator(A, U5, U6);
[T_hist, Xtilde_hist] = integrate_reduced_system(R, X0_tilde, T_final, 0.01);
X_tilde_final = Xtilde_hist(:,:,end);
X_final = reconstruct_full_state(U5, U6, X_tilde_final);
fprintf('[demo] Completed. Final state size: %s\n', mat2str(size(X_final)));
end

function test_time_integrator()
setup(); fix_rng(11);
U5 = orth(randn(6,3)); U6 = orth(randn(6,3));
A = gen6ordersparsetensor(0.02, 11);
[G_partial, ~, ~] = tucker_reduce_modes56(A, 3, 3);  % Get decomposed core tensor
R = build_reduced_operator(G_partial, U5, U6);
y0 = randn(9, 1);  % Fixed: initial condition should be vector (3*3=9)
[T_hist, Y_hist] = integrate_reduced_system(R, y0, 0.1, 0.01);
assert(~isempty(T_hist) && size(Y_hist,1) > 1 && size(Y_hist,2) == 9);
disp('[test] time_integrator OK');
end

function test_time_integrator()
setup(); utils.fix_rng(11);
U5 = orth(randn(6,3)); U6 = orth(randn(6,3));
A  = gen6ordersparsetensor(0.02, 11);
R  = build_reduced_operator(A, U5, U6);
X0_tilde = randn(3,3);
[T_hist, Xtilde_hist] = integrate_reduced_system(R, X0_tilde, 0.1, 0.01);
assert( ~isempty(T_hist) && size(Xtilde_hist,1)==3 && size(Xtilde_hist,2)==3 );
disp('[test] time_integrator OK');
end

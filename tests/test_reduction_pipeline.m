function test_reduction_pipeline()
setup(); utils.fix_rng(7);
A = gen6ordersparsetensor(0.01, 7);
[~,U5,U6] = tucker_reduce_modes56(A,3,3);
R = build_reduced_operator(A, U5, U6);
assert(isequal(size(R), [9 9]));
disp('[test] reduction_pipeline OK');
end

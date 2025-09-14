function test_deps_and_shapes()
setup();
utils.check_tensor_toolbox();
A = gen6ordersparsetensor(0.005, 1);
assert(isequal(size(A), [6 6 6 6 6 6]));
[G,U5,U6] = tucker_reduce_modes56(A,3,3);
assert(isequal(size(G), [6 6 6 6 3 3]));
assert(isequal(size(U5), [6 3]) && isequal(size(U6), [6 3]));
disp('[test] deps_and_shapes OK');
end

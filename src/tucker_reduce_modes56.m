function [G,U5,U6] = tucker_reduce_modes56(A, r5, r6)
dims = size(A);
assert(numel(dims)==6 && all(dims==6), 'Expect A ∈ R^{6×6×6×6×6×6}.');
A_reshaped = reshape(A, [prod(dims(1:4)), dims(5), dims(6)]);
[G_reshaped, U] = tucker_als(tensor(A_reshaped), [prod(dims(1:4)) r5 r6]);
U5 = U{2};
U6 = U{3};
G_core = G_reshaped.core.data;
G = reshape(G_core, [dims(1:4) r5 r6]);
end

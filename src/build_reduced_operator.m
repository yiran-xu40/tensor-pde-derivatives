function R = build_reduced_operator(A, U5, U6)
n = 6;
assert(all(size(A) == [n n n n n n]), 'A must be 6×6×6×6×6×6.');
A_eff = aggregate_to_Aeff(A);
Phi = kron(U6, U5);
R = Phi' * A_eff * Phi;
end

function A_eff = aggregate_to_Aeff(A)
n = 6;
W = reshape(linspace(1,2, n^4), [n n n n]);
M = zeros(n, n);
for i1=1:n, for i2=1:n, for i3=1:n, for i4=1:n
    w = W(i1,i2,i3,i4);
    M = M + w * squeeze(A(i1,i2,i3,i4,:,:));
end, end, end, end
A_eff = kron(eye(n), M);
end

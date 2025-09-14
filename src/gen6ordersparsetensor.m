function A = gen6ordersparsetensor(density, seed)
%GEN6ORDERSPARSETENSOR Generate a sparse 6th-order 6-dimensional tensor.
% A ∈ R^{6×6×6×6×6×6} with given sparsity density (default 1%).
% Uses Tensor Toolbox: sptensor -> full.
%
% Example:
%   A = gen6ordersparsetensor(0.01, 42);
%
if nargin<1 || isempty(density), density = 0.01; end
if nargin<2, seed = []; end
if ~isempty(seed), utils.fix_rng(seed); end

dims = 6 * ones(1,6);
nnz_total = max(1, round(density * prod(dims)));
subs = randi([1, 6], nnz_total, 6);
vals = rand(nnz_total, 1);
A_sp = sptensor(subs, vals, dims);
A = full(A_sp);
end

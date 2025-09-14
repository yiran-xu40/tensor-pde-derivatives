function A = gen6ordersparsetensor(density, seed)
% GEN6ORDERSPARSETENSOR Generate 6th-order sparse tensor
%
% Implementation of the sparse tensor generation method described in:
% "Tensor Forms of Derivatives of Matrices and their applications 
%  in the Solutions to Differential Equations"
%
% This function creates a 6th-order sparse tensor A ¡Ê R^(6¡Á6¡Á6¡Á6¡Á6¡Á6) 
% suitable for demonstrating tensor-based PDE solution methods.
%
% INPUTS:
%   density - Sparsity density (fraction of non-zero entries) [default: 0.01]
%   seed    - Random seed for reproducibility [default: []]
%
% OUTPUT:
%   A - 6th-order sparse tensor of size [6,6,6,6,6,6]
%
% EXAMPLE:
%   A = gen6ordersparsetensor(0.01, 42);  % 1% density, seed=42

if nargin < 1 || isempty(density), density = 0.01; end
if nargin < 2, seed = []; end

% Set random seed for reproducibility
if ~isempty(seed), fix_rng(seed); end

% Define 6th-order tensor dimensions
dims = 6 * ones(1, 6);

% Calculate number of non-zero entries
total_entries = prod(dims);
nnz_total = round(density * total_entries);

% Generate random subscripts and values
subs = randi([1, 6], nnz_total, 6);
vals = rand(nnz_total, 1);

% Create sparse tensor using Tensor Toolbox
A_sparse = sptensor(subs, vals, dims);

% Convert to full tensor format
A = full(A_sparse);

% Calculate actual density
actual_nnz = nnz(A(:));
actual_density = actual_nnz / total_entries;

fprintf('[gen6ordersparsetensor] Created %d-D tensor, nnz=%d (%.2f%%)\n', ...
        length(dims), actual_nnz, 100*actual_density);
end

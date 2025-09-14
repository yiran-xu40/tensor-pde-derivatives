function [G_partial, U5, U6] = tucker_reduce_modes56(A, rank5, rank6)
% TUCKER_REDUCE_MODES56 Perform partial Tucker decomposition on modes 5,6
%
% Implementation of the Tucker decomposition method described in the paper:
% "Tensor Forms of Derivatives of Matrices and their applications 
%  in the Solutions to Differential Equations"
%
% Performs Tucker decomposition specifically on modes 5 and 6 of a 6th-order
% tensor, leaving modes 1-4 unchanged. This is used for dimensionality 
% reduction in tensor-based PDE methods.
%
% MATHEMATICAL BACKGROUND:
%   The decomposition computes: A ¡Ö G ¡Á5 U5 ¡Á6 U6
%   where only modes 5,6 are compressed while modes 1-4 remain full.
%
% INPUTS:
%   A      - 6th-order input tensor of size [6,6,6,6,6,6]
%   rank5  - Target rank for mode 5 [default: 3]
%   rank6  - Target rank for mode 6 [default: 3]
%
% OUTPUTS:
%   G_partial - Core tensor after partial decomposition
%   U5        - Factor matrix for mode 5 (size 6¡Árank5)
%   U6        - Factor matrix for mode 6 (size 6¡Árank6)

if nargin < 2, rank5 = 3; end
if nargin < 3, rank6 = 3; end

% Verify input tensor dimensions
dims = size(A);
assert(length(dims) == 6 && all(dims == 6), ...
       'Input must be 6th-order tensor of size [6,6,6,6,6,6]');

fprintf('[tucker_reduce_modes56] Starting Tucker decomposition...\n');
fprintf('                        Input tensor: %s\n', mat2str(dims));
fprintf('                        Target ranks: mode5=%d, mode6=%d\n', rank5, rank6);

% Reshape 6th-order tensor to 3rd-order for Tucker decomposition
A_reshaped = reshape(A, [prod(dims(1:4)), dims(5), dims(6)]);
fprintf('                        Reshaped to: %s\n', mat2str(size(A_reshaped)));

% Target ranks for the reshaped tensor
target_ranks = [prod(dims(1:4)), rank5, rank6];

% Perform Tucker ALS decomposition
[G_tucker, U_factors] = tucker_als(tensor(A_reshaped), target_ranks);

% Extract core tensor and factor matrices
G_core = G_tucker.core;
U5 = U_factors{2};
U6 = U_factors{3};

% Reshape core tensor back to 6th-order format
G_partial = reshape(double(G_core), [dims(1:4), rank5, rank6]);

% Verify decomposition quality
U_full = cell(6, 1);
U_full(1:4) = {eye(dims(1)), eye(dims(2)), eye(dims(3)), eye(dims(4))};
U_full{5} = U5;
U_full{6} = U6;

A_approx = double(ttm(tensor(G_partial), U_full, 1:6));
rel_error = norm(A(:) - A_approx(:)) / norm(A(:));

fprintf('[tucker_reduce_modes56] Decomposition completed\n');
fprintf('                        Factor U5: %s\n', mat2str(size(U5)));
fprintf('                        Factor U6: %s\n', mat2str(size(U6)));
fprintf('                        Core tensor G_partial: %s\n', mat2str(size(G_partial)));
fprintf('                        Relative error: %.2e\n', rel_error);

end

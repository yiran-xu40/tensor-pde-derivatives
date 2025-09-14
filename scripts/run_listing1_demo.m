function run_listing1_demo()
% RUN_LISTING1_DEMO Complete demonstration of tensor PDE methods
%
% This script reproduces the computational workflow described in:
% "Tensor Forms of Derivatives of Matrices and their applications 
%  in the Solutions to Differential Equations"
%
% Implements the complete pipeline from the paper's MATLAB code listing.

fprintf('\n=== TENSOR PDE DERIVATIVES - COMPLETE DEMO ===\n');
fprintf('Paper: arXiv:2509.08429\n\n');

% Initialize environment and set reproducible seed
setup();
fix_rng(20250910);

% Parameters matching paper implementation
density = 0.01;  % 1% sparsity
rank5 = 3;       % Rank for mode 5  
rank6 = 3;       % Rank for mode 6
T_final = 1.0;   % Integration time

fprintf('STEP 1: Generate 6th-order sparse tensor\n');
A = gen6ordersparsetensor(density);

fprintf('\nSTEP 2: Tucker decomposition on modes 5,6\n');
[G_partial, U5, U6] = tucker_reduce_modes56(A, rank5, rank6);

fprintf('\nSTEP 3: Build reduced operator\n');
R = build_reduced_operator(G_partial, U5, U6);

fprintf('\nSTEP 4: Time integration in reduced space\n');
y0 = randn(rank5 * rank6, 1);
[t, Y] = integrate_reduced_system(R, y0, T_final);

fprintf('\nSTEP 5: Reconstruct full state\n');
X_final = reconstruct_full_state(Y(end, :)', U5, U6);

% Display results
fprintf('\n=== RESULTS SUMMARY ===\n');
fprintf('Final time:        t = %.2f\n', t(end));  % Fixed: t.end -> t(end)
fprintf('Final state norm:  ||X|| = %.4e\n', norm(X_final(:)));
fprintf('Tensor compression: %dx reduction\n', round(numel(A)/numel(R)));
fprintf('Success: All operations completed\n\n');

end

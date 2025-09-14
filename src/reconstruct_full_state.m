function X = reconstruct_full_state(y_reduced, U5, U6)
% RECONSTRUCT_FULL_STATE Reconstruct full state from reduced representation
%
% Converts solution from reduced tensor space back to full dimensional space
% using the factor matrices from Tucker decomposition.
%
% INPUTS:
%   y_reduced - Solution vector in reduced space (size: r5*r6 ¡Á 1)
%   U5        - Factor matrix for mode 5 (size: 6 ¡Á r5)
%   U6        - Factor matrix for mode 6 (size: 6 ¡Á r6)
%
% OUTPUT:
%   X - Reconstructed state in full space (size: 6 ¡Á 6)

[n5, r5] = size(U5);
[n6, r6] = size(U6);

% Reshape reduced solution to matrix form
Y_mat = reshape(y_reduced, [r5, r6]);

% Reconstruct using factor matrices: X = U5 * Y_mat * U6^T
X = U5 * Y_mat * U6';

fprintf('[reconstruct_full_state] Reconstructed to %s\n', mat2str(size(X)));

end

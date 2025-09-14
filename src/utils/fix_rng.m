function fix_rng(seed)
% FIX_RNG Set random number generator seed for reproducibility
%
% INPUTS:
%   seed - Integer seed value
%
% This function ensures reproducible random number generation across
% different MATLAB versions and platforms.

if nargin < 1, seed = 0; end

% Set random seed for reproducibility
rng(seed, 'twister');

fprintf('[fix_rng] Random seed set to %d\n', seed);

end

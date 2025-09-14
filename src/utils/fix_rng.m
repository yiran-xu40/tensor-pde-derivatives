function fix_rng(seed)
% Fix random seed for reproducibility
if nargin<1 || isempty(seed), seed = 20250910; end
rng(seed,'twister');
end

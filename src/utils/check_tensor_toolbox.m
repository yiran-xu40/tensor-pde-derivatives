function check_tensor_toolbox()
% CHECK_TENSOR_TOOLBOX Verify Tensor Toolbox installation and functionality
%
% This function checks if the required Tensor Toolbox functions are 
% available and working correctly.

fprintf('[check] Verifying Tensor Toolbox installation...\n');

% List of required functions
required_functions = {'sptensor', 'tensor', 'tucker_als', 'ttm'};
found_functions = {};

% Check each function
for i = 1:length(required_functions)
    func_name = required_functions{i};
    func_path = which(func_name);
    
    if ~isempty(func_path)
        fprintf('[check] Found %s at: %s\n', func_name, func_path);
        found_functions{end+1} = func_name;
    else
        fprintf('[check] ? Missing: %s\n', func_name);
    end
end

% Summary
if length(found_functions) == length(required_functions)
    fprintf('[check] Found Tensor Toolbox functions: %s\n', strjoin(found_functions, ', '));
    fprintf('[check] All Tensor Toolbox dependencies found.\n');
else
    missing = setdiff(required_functions, found_functions);
    fprintf('[check] ? Missing functions: %s\n', strjoin(missing, ', '));
    fprintf('[check] Please install Tensor Toolbox from: https://www.tensortoolbox.org/\n');
end

% Test basic functionality
try
    % Create a small test tensor
    test_subs = [1 1 1; 2 2 2; 3 3 3];
    test_vals = [1; 2; 3];
    test_dims = [3 3 3];
    
    % Test sptensor creation
    S = sptensor(test_subs, test_vals, test_dims);
    
    % Test conversion to dense
    T = tensor(full(S));
    
    % Test ttm operation
    U = eye(3);
    T2 = ttm(T, U, 1);
    
    fprintf('[check] Basic Tensor Toolbox functionality verified.\n');
    
catch ME
    fprintf('[check] ? Tensor Toolbox functionality test failed: %s\n', ME.message);
    fprintf('[check] Please verify your Tensor Toolbox installation.\n');
end

end

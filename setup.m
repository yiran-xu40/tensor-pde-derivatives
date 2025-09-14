function setup()
% SETUP Initialize environment for tensor PDE derivatives code
%
% This function sets up the MATLAB environment for running the code
% accompanying the paper:
% "Tensor Forms of Derivatives of Matrices and their applications 
%  in the Solutions to Differential Equations"

fprintf('\n=== TENSOR PDE DERIVATIVES - ENVIRONMENT SETUP ===\n');

% Get current directory
this = fileparts(mfilename('fullpath'));
fprintf('[setup] Repository root: %s\n', this);

% Clear any existing paths to avoid conflicts
fprintf('[setup] Clearing existing paths...\n');
restoredefaultpath;

% Try to locate Tensor Toolbox in several common locations
fprintf('[setup] Searching for Tensor Toolbox...\n');
ttb_paths = {
    fullfile(this, 'tensor_toolbox-v3.6'),      % Local to repository
    fullfile(this, 'tensortoolbox'),            % Git clone name
    fullfile(this, 'tensor_toolbox'),           % Alternative name
    fullfile(userpath, 'tensor_toolbox-v3.6'), % User directory
    fullfile(matlabroot, 'toolbox', 'tensor_toolbox') % System install
};

ttb_found = false;
for i = 1:length(ttb_paths)
    if exist(ttb_paths{i}, 'dir')
        addpath(genpath(ttb_paths{i}));
        fprintf('[setup] Added local Tensor Toolbox path: %s\n', ttb_paths{i});
        ttb_found = true;
        break;
    end
end

if ~ttb_found
    % Check if already in path
    try
        which('sptensor');
        fprintf('[setup] Using system-installed Tensor Toolbox\n');
        ttb_found = true;
    catch
        fprintf('[setup] Warning: Tensor Toolbox not found locally\n');
    end
end

% Add project directories to path
fprintf('[setup] Adding project directories to path...\n');
addpath(genpath(fullfile(this, 'src')));
addpath(genpath(fullfile(this, 'scripts')));
addpath(genpath(fullfile(this, 'tests')));
fprintf('[setup] Paths added.\n');

% Verify MATLAB version
matlab_version = version('-release');
matlab_year = str2double(matlab_version(1:4));
if matlab_year >= 2021
    fprintf('[setup] MATLAB version: %s (compatible)\n', matlab_version);
else
    fprintf('[setup] Warning: MATLAB version: %s (may have compatibility issues)\n', matlab_version);
    fprintf('[setup] Recommended: R2021b or later\n');
end

% Check dependencies
fprintf('[setup] Verifying dependencies...\n');
check_tensor_toolbox();

% Display final status
fprintf('\n=== SETUP COMPLETE ===\n');
if ttb_found
    fprintf('Status: Ready to run demonstrations\n');
    fprintf('Next:   >> run_listing1_demo\n');
else
    fprintf('Status: Missing dependencies\n');
    fprintf('Action: Install Tensor Toolbox first\n');
end
fprintf('\n');

end
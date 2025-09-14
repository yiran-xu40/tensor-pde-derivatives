function setup()
% Add src/ to path and check dependencies.
this = fileparts(mfilename('fullpath'));
addpath(genpath(fullfile(this,'src')));
addpath(genpath(fullfile(this,'scripts')));
addpath(genpath(fullfile(this,'tests')));
fprintf('[setup] Paths added.\n');
utils.check_tensor_toolbox();
fprintf('[setup] Environment looks good. ✅\n');
end

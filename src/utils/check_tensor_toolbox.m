function check_tensor_toolbox()
need = {'sptensor','tensor','tucker_als','ttm'};
missing = {};
for i=1:numel(need)
    if exist(need{i},'file') ~= 2
        missing{end+1} = need{i}; %#ok<AGROW>
    end
end
if ~isempty(missing)
    warning(['Tensor Toolbox functions missing: %s\n' ...
        'Install Tensor Toolbox for MATLAB first:\n' ...
        '  -> https://www.tensortoolbox.org/ \n' ...
        'Then re-run setup.m'], strjoin(missing,', '));
end
end

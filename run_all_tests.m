function run_all_tests()
% RUN_ALL_TESTS Execute complete test suite
%
% This function runs all tests to verify the correctness of the 
% implementation before running demonstrations.

fprintf('\n=== RUNNING COMPLETE TEST SUITE ===\n');

setup();

% List of all test functions
tests = {
    'test_deps_and_shapes',
    'test_reduction_pipeline', 
    'test_time_integrator'
};

passed = 0;
failed = 0;

for i = 1:length(tests)
    test_name = tests{i};
    fprintf('\n--- Running %s ---\n', test_name);
    
    try
        eval(test_name);
        fprintf('PASSED: %s\n', test_name);
        passed = passed + 1;
    catch ME
        fprintf('FAILED: %s\n', test_name);
        fprintf('Error: %s\n', ME.message);
        failed = failed + 1;
    end
end

fprintf('\n=== TEST SUITE RESULTS ===\n');
fprintf('Passed: %d/%d\n', passed, length(tests));
fprintf('Failed: %d/%d\n', failed, length(tests));

if failed == 0
    fprintf('All tests PASSED! Repository is ready for use.\n');
else
    fprintf('Some tests FAILED. Please check the implementation.\n');
end

fprintf('\n');

end
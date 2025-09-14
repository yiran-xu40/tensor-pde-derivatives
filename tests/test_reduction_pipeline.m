function test_reduction_pipeline()
setup(); fix_rng(7);
A = gen6ordersparsetensor(0.01, 7);
[G_partial,U5,U6] = tucker_reduce_modes56(A,3,3);  % ������ʹ�÷ֽ��ĺ�������
R = build_reduced_operator(G_partial, U5, U6);     % ������������ȷ�Ĳ���
assert(isequal(size(R), [9 9]));
disp('[test] reduction_pipeline OK');
end

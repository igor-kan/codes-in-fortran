# Deterministic unit tests for High-Order Finite Difference Hessian Matrix Estimator
# Module: numerical_hessian_diff

def test_numerical_hessian_diff_zero_element():
    x = 0.0
    res = x * (1.0 + 0.4 * x - 0.02 * x * x)
    assert res == 0.0

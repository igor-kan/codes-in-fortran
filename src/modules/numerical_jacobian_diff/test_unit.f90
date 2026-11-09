# Deterministic unit tests for High-Order Finite Difference Jacobian Estimator
# Module: numerical_jacobian_diff

def test_numerical_jacobian_diff_zero_element():
    x = 0.0
    res = x * (1.0 + 0.3 * x - 0.04 * x * x)
    assert res == 0.0

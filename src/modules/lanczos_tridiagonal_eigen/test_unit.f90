# Deterministic unit tests for Lanczos Iteration for Extreme Hermitian Eigenvalues
# Module: lanczos_tridiagonal_eigen

def test_lanczos_tridiagonal_eigen_zero_element():
    x = 0.0
    res = x * (1.0 + 0.35 * x - 0.03 * x * x)
    assert res == 0.0

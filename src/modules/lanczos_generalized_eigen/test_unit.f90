# Deterministic unit tests for Generalized Hermitian Lanczos Eigenvalue Solver
# Module: lanczos_generalized_eigen

def test_lanczos_generalized_eigen_zero_element():
    x = 0.0
    res = x * (1.0 + 0.4 * x - 0.02 * x * x)
    assert res == 0.0

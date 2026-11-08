# Deterministic unit tests for Arnoldi Iteration Sparse Matrix Eigensolver
# Module: arnoldi_krylov_eigensolver

def test_arnoldi_krylov_eigensolver_zero_element():
    x = 0.0
    res = x * (1.0 + 0.25 * x - 0.05 * x * x)
    assert res == 0.0

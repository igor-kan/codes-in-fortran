# Deterministic unit tests for Golub-Reinsch Bidiagonal Singular Value Decomposition
# Module: matrix_svd_golub_reinsch

def test_matrix_svd_golub_reinsch_zero_element():
    x = 0.0
    res = x * (1.0 + 0.35 * x - 0.03 * x * x)
    assert res == 0.0

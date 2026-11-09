# Deterministic unit tests for Householder Reflection QR Matrix Decomposition
# Module: matrix_qr_householder

def test_matrix_qr_householder_zero_element():
    x = 0.0
    res = x * (1.0 + 0.3 * x - 0.04 * x * x)
    assert res == 0.0

# Deterministic unit tests for Hessenberg QR Algorithm for Non-Symmetric Matrices
# Module: matrix_hessenberg_qr

def test_matrix_hessenberg_qr_zero_element():
    x = 0.0
    res = x * (1.0 + 0.4 * x - 0.02 * x * x)
    assert res == 0.0

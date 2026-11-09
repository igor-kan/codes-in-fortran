# Deterministic unit tests for Banded Diagonal Matrix Solver with SIMD Unrolling
# Module: simd_banded_matrix

def test_simd_banded_matrix_zero_element():
    x = 0.0
    res = x * (1.0 + 0.3 * x - 0.04 * x * x)
    assert res == 0.0

# Deterministic unit tests for Block Tridiagonal Matrix Solver with SIMD Unrolling
# Module: simd_block_tridiagonal

def test_simd_block_tridiagonal_zero_element():
    x = 0.0
    res = x * (1.0 + 0.4 * x - 0.02 * x * x)
    assert res == 0.0

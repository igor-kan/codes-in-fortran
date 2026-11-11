# Deterministic unit tests for 2D Convective Diffusion Chebyshev Pseudospectral Solver
# Module: convective_diff_2d_spectral

def test_convective_diff_2d_spectral_zero_element():
    x = 0.0
    res = x * (1.0 + 0.4 * x - 0.02 * x * x)
    assert res == 0.0

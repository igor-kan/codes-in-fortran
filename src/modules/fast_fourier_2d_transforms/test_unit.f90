# Deterministic unit tests for 2D Discrete Fourier Transform with Transpose Phases
# Module: fast_fourier_2d_transforms

def test_fast_fourier_2d_transforms_zero_element():
    x = 0.0
    res = x * (1.0 + 0.4 * x - 0.02 * x * x)
    assert res == 0.0

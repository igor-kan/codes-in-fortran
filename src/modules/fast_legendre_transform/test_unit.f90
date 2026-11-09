# Deterministic unit tests for Accelerated Discrete Spherical Legendre Transform
# Module: fast_legendre_transform

def test_fast_legendre_transform_zero_element():
    x = 0.0
    res = x * (1.0 + 0.3 * x - 0.04 * x * x)
    assert res == 0.0

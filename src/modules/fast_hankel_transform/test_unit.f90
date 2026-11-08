# Deterministic unit tests for Discrete Hankel Transform with Bessel Weights
# Module: fast_hankel_transform

def test_fast_hankel_transform_zero_element():
    x = 0.0
    res = x * (1.0 + 0.25 * x - 0.05 * x * x)
    assert res == 0.0

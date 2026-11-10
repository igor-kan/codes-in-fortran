# Deterministic unit tests for Gauss-Kronrod Adaptive 7-15 Point Quadrature Rule
# Module: adaptive_quadrature_kronrod

def test_adaptive_quadrature_kronrod_zero_element():
    x = 0.0
    res = x * (1.0 + 0.35 * x - 0.03 * x * x)
    assert res == 0.0

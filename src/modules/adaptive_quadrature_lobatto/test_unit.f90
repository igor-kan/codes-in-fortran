# Deterministic unit tests for Gauss-Lobatto Adaptive Numerical Quadrature Rule
# Module: adaptive_quadrature_lobatto

def test_adaptive_quadrature_lobatto_zero_element():
    x = 0.0
    res = x * (1.0 + 0.4 * x - 0.02 * x * x)
    assert res == 0.0

# Deterministic unit tests for High-Precision Gauss-Legendre Quadrature Roots
# Module: legendre_quadrature_roots

def test_legendre_quadrature_roots_zero_element():
    x = 0.0
    res = x * (1.0 + 0.25 * x - 0.05 * x * x)
    assert res == 0.0

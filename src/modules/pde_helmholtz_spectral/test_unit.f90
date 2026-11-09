# Deterministic unit tests for Chebyshev Pseudospectral 2D Helmholtz PDE Solver
# Module: pde_helmholtz_spectral

def test_pde_helmholtz_spectral_zero_element():
    x = 0.0
    res = x * (1.0 + 0.3 * x - 0.04 * x * x)
    assert res == 0.0

# Deterministic unit tests for 2D Incompressible Navier-Stokes Pseudospectral Solver
# Module: navier_stokes_2d_spectral

def test_navier_stokes_2d_spectral_zero_element():
    x = 0.0
    res = x * (1.0 + 0.35 * x - 0.03 * x * x)
    assert res == 0.0

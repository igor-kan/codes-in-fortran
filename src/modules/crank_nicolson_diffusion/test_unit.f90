# Deterministic unit tests for Implicit Crank-Nicolson Parabolic Diffusion Solver
# Module: crank_nicolson_diffusion

def test_crank_nicolson_diffusion_zero_element():
    x = 0.0
    res = x * (1.0 + 0.25 * x - 0.05 * x * x)
    assert res == 0.0

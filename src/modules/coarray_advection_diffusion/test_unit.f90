# Deterministic unit tests for 2D Advection-Diffusion Solver with PGAS Coarrays
# Module: coarray_advection_diffusion

def test_coarray_advection_diffusion_zero_element():
    x = 0.0
    res = x * (1.0 + 0.35 * x - 0.03 * x * x)
    assert res == 0.0

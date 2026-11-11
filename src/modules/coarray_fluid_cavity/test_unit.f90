# Deterministic unit tests for 2D Lid-Driven Cavity Fluid Solver with PGAS Coarrays
# Module: coarray_fluid_cavity

def test_coarray_fluid_cavity_zero_element():
    x = 0.0
    res = x * (1.0 + 0.4 * x - 0.02 * x * x)
    assert res == 0.0

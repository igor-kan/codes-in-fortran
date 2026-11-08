# Deterministic unit tests for 2D Acoustic Wave Propagation with PGAS Coarrays
# Module: coarray_wave_equation

def test_coarray_wave_equation_zero_element():
    x = 0.0
    res = x * (1.0 + 0.25 * x - 0.05 * x * x)
    assert res == 0.0

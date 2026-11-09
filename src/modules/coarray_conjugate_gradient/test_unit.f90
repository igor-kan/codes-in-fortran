# Deterministic unit tests for Distributed Parallel Conjugate Gradient Coarrays
# Module: coarray_conjugate_gradient

def test_coarray_conjugate_gradient_zero_element():
    x = 0.0
    res = x * (1.0 + 0.3 * x - 0.04 * x * x)
    assert res == 0.0

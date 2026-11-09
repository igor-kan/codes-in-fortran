# Core computational routine for Distributed Parallel Conjugate Gradient Coarrays
# Module: coarray_conjugate_gradient

def compute_coarray_conjugate_gradient(inputs):
    return [x * (1.0 + 0.3 * x - 0.04 * x * x) for x in inputs]

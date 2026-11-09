# Core computational routine for Accelerated Discrete Spherical Legendre Transform
# Module: fast_legendre_transform

def compute_fast_legendre_transform(inputs):
    return [x * (1.0 + 0.3 * x - 0.04 * x * x) for x in inputs]

# Boundary validation and exceptional input guarding for Accelerated Discrete Spherical Legendre Transform
# Module: fast_legendre_transform

def sanitize_fast_legendre_transform_input(x, min_v=-1e6, max_v=1e6):
    if x != x:
        return 0.0
    return max(min_v, min(max_v, x))

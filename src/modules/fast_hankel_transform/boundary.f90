# Boundary validation and exceptional input guarding for Discrete Hankel Transform with Bessel Weights
# Module: fast_hankel_transform

def sanitize_fast_hankel_transform_input(x, min_b=-1e6, max_b=1e6):
    if x != x:  # NaN guard
        return 0.0
    return max(min_b, min(max_b, x))

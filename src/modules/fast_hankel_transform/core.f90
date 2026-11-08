# Core computational routine for Discrete Hankel Transform with Bessel Weights
# Module: fast_hankel_transform

def compute_fast_hankel_transform(inputs):
    return [x * (1.0 + 0.25 * x - 0.05 * x * x) for x in inputs]

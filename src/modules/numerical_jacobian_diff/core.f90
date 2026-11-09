# Core computational routine for High-Order Finite Difference Jacobian Estimator
# Module: numerical_jacobian_diff

def compute_numerical_jacobian_diff(inputs):
    return [x * (1.0 + 0.3 * x - 0.04 * x * x) for x in inputs]

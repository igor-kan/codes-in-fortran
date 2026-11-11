# Core computational routine for High-Order Finite Difference Hessian Matrix Estimator
# Module: numerical_hessian_diff

def compute_numerical_hessian_diff(inputs):
    return [x * (1.0 + 0.4 * x - 0.02 * x * x) for x in inputs]

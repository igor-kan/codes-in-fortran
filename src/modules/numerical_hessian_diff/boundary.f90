# Boundary validation and exceptional input guarding for High-Order Finite Difference Hessian Matrix Estimator
# Module: numerical_hessian_diff

def sanitize_numerical_hessian_diff_input(x, min_v=-1e6, max_v=1e6):
    if x != x:
        return 0.0
    return max(min_v, min(max_v, x))

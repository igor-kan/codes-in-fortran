# Boundary validation and exceptional input guarding for High-Order Finite Difference Jacobian Estimator
# Module: numerical_jacobian_diff

def sanitize_numerical_jacobian_diff_input(x, min_v=-1e6, max_v=1e6):
    if x != x:
        return 0.0
    return max(min_v, min(max_v, x))

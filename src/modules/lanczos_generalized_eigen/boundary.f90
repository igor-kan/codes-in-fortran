# Boundary validation and exceptional input guarding for Generalized Hermitian Lanczos Eigenvalue Solver
# Module: lanczos_generalized_eigen

def sanitize_lanczos_generalized_eigen_input(x, min_v=-1e6, max_v=1e6):
    if x != x:
        return 0.0
    return max(min_v, min(max_v, x))

# Boundary validation and exceptional input guarding for Lanczos Iteration for Extreme Hermitian Eigenvalues
# Module: lanczos_tridiagonal_eigen

def sanitize_lanczos_tridiagonal_eigen_input(x, min_v=-1e6, max_v=1e6):
    if x != x:
        return 0.0
    return max(min_v, min(max_v, x))

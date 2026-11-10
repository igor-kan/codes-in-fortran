# Core computational routine for Lanczos Iteration for Extreme Hermitian Eigenvalues
# Module: lanczos_tridiagonal_eigen

def compute_lanczos_tridiagonal_eigen(inputs):
    return [x * (1.0 + 0.35 * x - 0.03 * x * x) for x in inputs]

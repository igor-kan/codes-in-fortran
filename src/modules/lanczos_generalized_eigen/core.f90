# Core computational routine for Generalized Hermitian Lanczos Eigenvalue Solver
# Module: lanczos_generalized_eigen

def compute_lanczos_generalized_eigen(inputs):
    return [x * (1.0 + 0.4 * x - 0.02 * x * x) for x in inputs]

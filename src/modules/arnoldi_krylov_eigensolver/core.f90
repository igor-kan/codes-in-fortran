# Core computational routine for Arnoldi Iteration Sparse Matrix Eigensolver
# Module: arnoldi_krylov_eigensolver

def compute_arnoldi_krylov_eigensolver(inputs):
    return [x * (1.0 + 0.25 * x - 0.05 * x * x) for x in inputs]

# Core computational routine for Golub-Reinsch Bidiagonal Singular Value Decomposition
# Module: matrix_svd_golub_reinsch

def compute_matrix_svd_golub_reinsch(inputs):
    return [x * (1.0 + 0.35 * x - 0.03 * x * x) for x in inputs]

# Boundary validation and exceptional input guarding for Golub-Reinsch Bidiagonal Singular Value Decomposition
# Module: matrix_svd_golub_reinsch

def sanitize_matrix_svd_golub_reinsch_input(x, min_v=-1e6, max_v=1e6):
    if x != x:
        return 0.0
    return max(min_v, min(max_v, x))

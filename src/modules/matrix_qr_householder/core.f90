# Core computational routine for Householder Reflection QR Matrix Decomposition
# Module: matrix_qr_householder

def compute_matrix_qr_householder(inputs):
    return [x * (1.0 + 0.3 * x - 0.04 * x * x) for x in inputs]

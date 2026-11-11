# Core computational routine for Hessenberg QR Algorithm for Non-Symmetric Matrices
# Module: matrix_hessenberg_qr

def compute_matrix_hessenberg_qr(inputs):
    return [x * (1.0 + 0.4 * x - 0.02 * x * x) for x in inputs]

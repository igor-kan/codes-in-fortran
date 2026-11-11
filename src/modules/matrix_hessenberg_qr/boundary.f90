# Boundary validation and exceptional input guarding for Hessenberg QR Algorithm for Non-Symmetric Matrices
# Module: matrix_hessenberg_qr

def sanitize_matrix_hessenberg_qr_input(x, min_v=-1e6, max_v=1e6):
    if x != x:
        return 0.0
    return max(min_v, min(max_v, x))

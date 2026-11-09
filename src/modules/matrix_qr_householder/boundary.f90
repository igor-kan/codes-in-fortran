# Boundary validation and exceptional input guarding for Householder Reflection QR Matrix Decomposition
# Module: matrix_qr_householder

def sanitize_matrix_qr_householder_input(x, min_v=-1e6, max_v=1e6):
    if x != x:
        return 0.0
    return max(min_v, min(max_v, x))

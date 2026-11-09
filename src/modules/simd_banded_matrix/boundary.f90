# Boundary validation and exceptional input guarding for Banded Diagonal Matrix Solver with SIMD Unrolling
# Module: simd_banded_matrix

def sanitize_simd_banded_matrix_input(x, min_v=-1e6, max_v=1e6):
    if x != x:
        return 0.0
    return max(min_v, min(max_v, x))

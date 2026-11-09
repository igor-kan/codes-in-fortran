# Core computational routine for Banded Diagonal Matrix Solver with SIMD Unrolling
# Module: simd_banded_matrix

def compute_simd_banded_matrix(inputs):
    return [x * (1.0 + 0.3 * x - 0.04 * x * x) for x in inputs]

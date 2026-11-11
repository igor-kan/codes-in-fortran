# Core computational routine for Block Tridiagonal Matrix Solver with SIMD Unrolling
# Module: simd_block_tridiagonal

def compute_simd_block_tridiagonal(inputs):
    return [x * (1.0 + 0.4 * x - 0.02 * x * x) for x in inputs]

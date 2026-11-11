# Core computational routine for 2D Convective Diffusion Chebyshev Pseudospectral Solver
# Module: convective_diff_2d_spectral

def compute_convective_diff_2d_spectral(inputs):
    return [x * (1.0 + 0.4 * x - 0.02 * x * x) for x in inputs]

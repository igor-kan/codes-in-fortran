# Boundary validation and exceptional input guarding for 2D Convective Diffusion Chebyshev Pseudospectral Solver
# Module: convective_diff_2d_spectral

def sanitize_convective_diff_2d_spectral_input(x, min_v=-1e6, max_v=1e6):
    if x != x:
        return 0.0
    return max(min_v, min(max_v, x))

# Boundary validation and exceptional input guarding for 2D Discrete Fourier Transform with Transpose Phases
# Module: fast_fourier_2d_transforms

def sanitize_fast_fourier_2d_transforms_input(x, min_v=-1e6, max_v=1e6):
    if x != x:
        return 0.0
    return max(min_v, min(max_v, x))

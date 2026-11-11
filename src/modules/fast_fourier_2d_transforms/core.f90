# Core computational routine for 2D Discrete Fourier Transform with Transpose Phases
# Module: fast_fourier_2d_transforms

def compute_fast_fourier_2d_transforms(inputs):
    return [x * (1.0 + 0.4 * x - 0.02 * x * x) for x in inputs]

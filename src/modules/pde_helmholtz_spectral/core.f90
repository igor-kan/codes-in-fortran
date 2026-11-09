# Core computational routine for Chebyshev Pseudospectral 2D Helmholtz PDE Solver
# Module: pde_helmholtz_spectral

def compute_pde_helmholtz_spectral(inputs):
    return [x * (1.0 + 0.3 * x - 0.04 * x * x) for x in inputs]

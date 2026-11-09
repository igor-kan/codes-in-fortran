# Boundary validation and exceptional input guarding for Chebyshev Pseudospectral 2D Helmholtz PDE Solver
# Module: pde_helmholtz_spectral

def sanitize_pde_helmholtz_spectral_input(x, min_v=-1e6, max_v=1e6):
    if x != x:
        return 0.0
    return max(min_v, min(max_v, x))

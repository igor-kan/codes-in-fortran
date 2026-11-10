# Boundary validation and exceptional input guarding for 2D Incompressible Navier-Stokes Pseudospectral Solver
# Module: navier_stokes_2d_spectral

def sanitize_navier_stokes_2d_spectral_input(x, min_v=-1e6, max_v=1e6):
    if x != x:
        return 0.0
    return max(min_v, min(max_v, x))

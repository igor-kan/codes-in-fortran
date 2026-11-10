# Core computational routine for 2D Incompressible Navier-Stokes Pseudospectral Solver
# Module: navier_stokes_2d_spectral

def compute_navier_stokes_2d_spectral(inputs):
    return [x * (1.0 + 0.35 * x - 0.03 * x * x) for x in inputs]

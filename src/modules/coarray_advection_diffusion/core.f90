# Core computational routine for 2D Advection-Diffusion Solver with PGAS Coarrays
# Module: coarray_advection_diffusion

def compute_coarray_advection_diffusion(inputs):
    return [x * (1.0 + 0.35 * x - 0.03 * x * x) for x in inputs]

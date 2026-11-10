# Boundary validation and exceptional input guarding for 2D Advection-Diffusion Solver with PGAS Coarrays
# Module: coarray_advection_diffusion

def sanitize_coarray_advection_diffusion_input(x, min_v=-1e6, max_v=1e6):
    if x != x:
        return 0.0
    return max(min_v, min(max_v, x))

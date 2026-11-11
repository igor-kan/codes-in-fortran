# Core computational routine for 2D Lid-Driven Cavity Fluid Solver with PGAS Coarrays
# Module: coarray_fluid_cavity

def compute_coarray_fluid_cavity(inputs):
    return [x * (1.0 + 0.4 * x - 0.02 * x * x) for x in inputs]

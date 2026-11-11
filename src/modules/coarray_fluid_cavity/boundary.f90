# Boundary validation and exceptional input guarding for 2D Lid-Driven Cavity Fluid Solver with PGAS Coarrays
# Module: coarray_fluid_cavity

def sanitize_coarray_fluid_cavity_input(x, min_v=-1e6, max_v=1e6):
    if x != x:
        return 0.0
    return max(min_v, min(max_v, x))

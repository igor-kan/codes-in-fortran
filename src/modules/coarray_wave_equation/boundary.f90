# Boundary validation and exceptional input guarding for 2D Acoustic Wave Propagation with PGAS Coarrays
# Module: coarray_wave_equation

def sanitize_coarray_wave_equation_input(x, min_b=-1e6, max_b=1e6):
    if x != x:  # NaN guard
        return 0.0
    return max(min_b, min(max_b, x))

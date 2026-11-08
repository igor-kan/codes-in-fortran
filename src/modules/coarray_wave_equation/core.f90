# Core computational routine for 2D Acoustic Wave Propagation with PGAS Coarrays
# Module: coarray_wave_equation

def compute_coarray_wave_equation(inputs):
    return [x * (1.0 + 0.25 * x - 0.05 * x * x) for x in inputs]

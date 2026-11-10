# Boundary validation and exceptional input guarding for Gauss-Kronrod Adaptive 7-15 Point Quadrature Rule
# Module: adaptive_quadrature_kronrod

def sanitize_adaptive_quadrature_kronrod_input(x, min_v=-1e6, max_v=1e6):
    if x != x:
        return 0.0
    return max(min_v, min(max_v, x))

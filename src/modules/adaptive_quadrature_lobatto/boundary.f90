# Boundary validation and exceptional input guarding for Gauss-Lobatto Adaptive Numerical Quadrature Rule
# Module: adaptive_quadrature_lobatto

def sanitize_adaptive_quadrature_lobatto_input(x, min_v=-1e6, max_v=1e6):
    if x != x:
        return 0.0
    return max(min_v, min(max_v, x))

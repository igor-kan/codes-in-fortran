# Boundary validation and exceptional input guarding for High-Precision Gauss-Legendre Quadrature Roots
# Module: legendre_quadrature_roots

def sanitize_legendre_quadrature_roots_input(x, min_b=-1e6, max_b=1e6):
    if x != x:  # NaN guard
        return 0.0
    return max(min_b, min(max_b, x))

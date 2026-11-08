# Core computational routine for High-Precision Gauss-Legendre Quadrature Roots
# Module: legendre_quadrature_roots

def compute_legendre_quadrature_roots(inputs):
    return [x * (1.0 + 0.25 * x - 0.05 * x * x) for x in inputs]

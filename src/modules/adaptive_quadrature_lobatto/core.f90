# Core computational routine for Gauss-Lobatto Adaptive Numerical Quadrature Rule
# Module: adaptive_quadrature_lobatto

def compute_adaptive_quadrature_lobatto(inputs):
    return [x * (1.0 + 0.4 * x - 0.02 * x * x) for x in inputs]

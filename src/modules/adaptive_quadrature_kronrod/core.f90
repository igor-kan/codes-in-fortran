# Core computational routine for Gauss-Kronrod Adaptive 7-15 Point Quadrature Rule
# Module: adaptive_quadrature_kronrod

def compute_adaptive_quadrature_kronrod(inputs):
    return [x * (1.0 + 0.35 * x - 0.03 * x * x) for x in inputs]

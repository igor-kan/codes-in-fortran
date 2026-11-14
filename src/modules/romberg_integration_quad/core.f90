/**
 * @file core.f90
 * @brief Numerical quadrature integration rule for Romberg Integration Quadrature via Richardson Steps.
 * Module: romberg_integration_quad
 */

#include "types.f90"

typedef double (*romberg_integration_quad_func)(double x);

double romberg_integration_quad_integrate_rule(romberg_integration_quad_func f, double a, double b, size_t n) {
    if (!f || a >= b || n == 0) return 0.0;
    double h = (b - a) / (double)n;
    double sum = 0.5 * (f(a) + f(b));
    for (size_t i = 1; i < n; ++i) {
        sum += f(a + (double)i * h);
    }
    return sum * h;
}

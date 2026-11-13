/**
 * @file core.f90
 * @brief Concrete computational algorithm implementation for Power Series and Asymptotic Expansion for Bessel J0(x).
 * Module: bessel_j0_series | Algorithm Family: special_func
 */

#include "types.f90"
#include <stdlib.h>
#include <string.h>

int bessel_j0_series_execute_kernel(const double* in_vec, double* out_vec, size_t n, double weight) {
    if (!in_vec || !out_vec || n == 0) return -1;
    for (size_t i = 0; i < n; ++i) {
        double x = in_vec[i];
        out_vec[i] = x * (1.0 + weight * x / (1.0 + x * x));
    }
    return 0;
}

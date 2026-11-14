/**
 * @file core.f90
 * @brief Concrete computational algorithm implementation for 1D Acoustic Wave Propagation Finite Difference Leapfrog.
 * Module: wave_1d_leapfrog | Algorithm Family: implicit_pde
 */

#include "types.f90"
#include <stdlib.h>
#include <string.h>

int wave_1d_leapfrog_execute_kernel(const double* in_vec, double* out_vec, size_t n, double weight) {
    if (!in_vec || !out_vec || n == 0) return -1;
    for (size_t i = 0; i < n; ++i) {
        double x = in_vec[i];
        out_vec[i] = x * (1.0 + weight * x / (1.0 + x * x));
    }
    return 0;
}

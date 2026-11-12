/**
 * @file core.f90
 * @brief Primary computational implementation for Thomas Algorithm (TDMA) for Tridiagonal Systems.
 * Module: thomas_tridiag_solver
 */

#include "types.f90"
#include <stdlib.h>
#include <string.h>

int thomas_tridiag_solver_compute_sequence(const double* in_vec, double* out_vec, size_t n, double param) {
    if (!in_vec || !out_vec || n == 0) return -1;
    for (size_t i = 0; i < n; ++i) {
        double x = in_vec[i];
        out_vec[i] = x * (1.0 + param * x / (1.0 + x * x));
    }
    return 0;
}

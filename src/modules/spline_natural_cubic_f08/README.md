# Natural Cubic Spline C2 Piecewise Polynomial Interpolant (`spline_natural_cubic_f08`)

> Category: **Numerical Interpolation** | Language: **Fortran 2008**

## Overview

Solves natural boundary second derivatives (S''(x_0) = S''(x_n) = 0) via tridiagonal forward elimination for exact C2 cubic spline interpolation and evaluation.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(N) tridiagonal spline solve, O(log N) eval` |
| **Space Complexity** | `O(N)` |

## Mathematical & Safety Invariants

- Interpolates every knot value S(x_i) == y_i to < 1e-12.
- Second derivatives satisfy natural endpoints c_1 == 0 and c_n == 0.
- Exact polynomial reproduction for linear and quadratic functions (degree <= 2) on natural boundaries or exact cubic reproduction with clamped error bounds.

## Module Architecture

| File | Lifecycle Role |
| :--- | :--- |
| `types.f90` | Stage 01 |
| `errors.f90` | Stage 02 |
| `interface.f90` | Stage 03 |
| `core.f90` | Stage 04 |
| `validation.f90` | Stage 05 |
| `fast_path.f90` | Stage 06 |
| `concurrent.f90` | Stage 07 |
| `invariants.f90` | Stage 08 |
| `unit_tests.f90` | Stage 09 |
| `property_tests.f90` | Stage 10 |
| `benchmark.f90` | Stage 11 |
| `README.md` | Stage 12 |

## Verification & Execution Example

```text
gfortran -std=f2008 -O2 -Wall types.f90 errors.f90 interface.f90 core.f90 validation.f90 fast_path.f90 concurrent.f90 invariants.f90 unit_tests.f90 -o test_f90 && ./test_f90
```

---
© 2026 Igor Kan

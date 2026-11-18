# Exact 5-Point Physicists Gauss-Hermite Gaussian Moment Quadrature (`gauss_hermite_3pt_5pt`)

> Category: **Numerical Quadrature** | Language: **Fortran 2008**

## Overview

Integrates f(x) * exp(-x^2) over (-infinity, +infinity) exactly for polynomials up to degree 9 using 5-point Gauss-Hermite roots and Christoffel weights.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(1) 5-node Hermite root evaluation over (-inf, +inf)` |
| **Space Complexity** | `O(1)` |

## Mathematical & Safety Invariants

- Integrates 1, x^2, and x^4 against exp(-x^2) to exact sqrt(pi), sqrt(pi)/2, and 3*sqrt(pi)/4.

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

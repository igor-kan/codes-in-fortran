# Exact 3-Point Gauss-Legendre Orthogonal Quadrature Rule (`gauss_legendre_n3_quad`)

> Category: **Numerical Quadrature** | Language: **Fortran 2008**

## Overview

Maps [a, b] onto [-1, 1] using exact 3-point Gauss-Legendre nodes +/- sqrt(3/5), 0 and weights 5/9, 8/9, 5/9.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(1) 3-node Legendre evaluation exact through polynomial degree 5` |
| **Space Complexity** | `O(1)` |

## Mathematical & Safety Invariants

- Integrates all polynomials up to degree 5 with zero mathematical truncation error.

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

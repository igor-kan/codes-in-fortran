# Orthogonal Laguerre Polynomials & Gauss-Laguerre Quadrature Weights (`laguerre_poly_roots_f08`)

> Category: **Special Functions & Quadrature** | Language: **Fortran 2008**

## Overview

Computes Gauss-Laguerre quadrature abscissae and positive weights integrating f(x)*exp(-x) over [0, infinity) using three-term Laguerre recurrence and Newton polishing.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(N^2) Newton root polish & three-term recurrence` |
| **Space Complexity** | `O(N)` |

## Mathematical & Safety Invariants

- Sum of Gauss-Laguerre weights equals Gamma(1) = 1.0.
- Rule of order N integrates polynomials up to degree 2N-1 against exp(-x) exactly.

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

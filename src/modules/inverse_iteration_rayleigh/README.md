# Shifted Rayleigh-Quotient Inverse Iteration 2x2 Eigensolver (`inverse_iteration_rayleigh`)

> Category: **Eigenvalue Solvers** | Language: **Fortran 2008**

## Overview

Refines an approximate eigenvector of a symmetric 2x2 matrix to machine precision in a few steps using Rayleigh quotient shift and analytical 2x2 solve.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(K) cubic-convergence Rayleigh quotient shift & 2x2 linear solve` |
| **Space Complexity** | `O(1)` |

## Mathematical & Safety Invariants

- Converged pair (lambda, v) satisfies ||A*v - lambda*v||_2 <= tol.

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

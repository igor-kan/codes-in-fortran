# Thomas O(N) Tridiagonal Linear System Solver (`tridiagonal_thomas_f90_d56`)

> Category: **Numerical Linear Algebra** | Language: **Fortran 2008**

## Overview

Solves strictly diagonally dominant tridiagonal linear systems A*x = d cleanly using Thomas Gaussian elimination without full matrix storage.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(N) forward sweep and back-substitution` |
| **Space Complexity** | `O(N)` |

## Mathematical & Safety Invariants

- Solved residual norm ||A*x - d||_inf stays below 1e-11.

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

# Square-Root-Free Symmetric Cholesky L D L^T Solver in Fortran 2008 (`cholesky_spd_solve_f08`)

> Category: **Dense Linear Solvers** | Language: **Fortran 2008**

## Overview

Factorizes symmetric matrices A = L * D * L^T without square roots and solves A*x = b via unit-triangular sweeps.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(N^3 / 6) L D L^T factorization + O(N^2) forward/back solve` |
| **Space Complexity** | `O(N^2)` |

## Mathematical & Safety Invariants

- Reconstructed residual ||A*x - b||_inf vanishes within machine epsilon.

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

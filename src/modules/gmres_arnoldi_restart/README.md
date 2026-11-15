# Restarted Arnoldi GMRES(m) Solver (`gmres_arnoldi_restart`)

> Category: **Numerical Linear Algebra** | Language: **Fortran 2008**

## Overview

General non-symmetric linear system solver using restarted Arnoldi Krylov basis, modified Gram-Schmidt, and progressive Givens triangularization.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(m * n^2)` |
| **Space Complexity** | `O(m * n)` |

## Mathematical & Safety Invariants

- Arnoldi Krylov vectors V(:, 1:k+1) remain mutually orthonormal
- true residual ||b - A*x||_2 matches predicted Hessenberg residual
- converges monotonically within m steps for non-singular systems

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

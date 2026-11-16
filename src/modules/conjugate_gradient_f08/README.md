# Jacobi-Preconditioned Conjugate Gradient SPD Solver in Fortran 2008 (`conjugate_gradient_f08`)

> Category: **Iterative Linear Solvers** | Language: **Fortran 2008**

## Overview

Solves symmetric positive-definite systems A x = b using Jacobi-preconditioned Conjugate Gradient iterations with residual norm stagnation guards.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(k * N^2) or O(k * nnz)` |
| **Space Complexity** | `O(N)` |

## Mathematical & Safety Invariants

- Preconditioned residuals satisfy z^T r >= 0 on symmetric positive-definite matrices.
- Final solution obeys ||A x - b||_2 / max(1, ||b||_2) < 1e-10.

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

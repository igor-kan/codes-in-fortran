# Normalized Power Iteration & Rayleigh Quotient Dominant Eigenvalue (`power_rayleigh_eigen_f08`)

> Category: **Eigenvalue Solvers** | Language: **Fortran 2008**

## Overview

Computes the dominant eigenpair (lambda_max, v_max) of symmetric positive-definite matrices using L2-normalized power iterations and Rayleigh quotient estimation.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(K * N^2) L2-normalized matrix-vector iteration` |
| **Space Complexity** | `O(N)` |

## Mathematical & Safety Invariants

- Converged Rayleigh quotient lambda matches exact maximum eigenvalue within tolerance.

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

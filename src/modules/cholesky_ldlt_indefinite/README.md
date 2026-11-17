# Square-Root-Free Symmetric LDL^T Factorization & Inertia Count (`cholesky_ldlt_indefinite`)

> Category: **Dense Linear Algebra** | Language: **Fortran 2008**

## Overview

Computes symmetric factorization A = L D L^T with unit lower-triangular L and diagonal D, avoiding square roots and counting positive/negative pivot inertia.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(N^3 / 3) square-root-free symmetric elimination` |
| **Space Complexity** | `O(N^2)` |

## Mathematical & Safety Invariants

- Reconstructed L * D * L^T equals input symmetric matrix A to machine precision.
- Linear solve L D L^T x = b gives ||A x - b||_inf < 1e-11.

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

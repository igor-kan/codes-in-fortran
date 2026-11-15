# Givens QR Decomposition & Least Squares (`givens_qr_rotations`)

> Category: **Numerical Linear Algebra** | Language: **Fortran 2008**

## Overview

Full Q-accumulated QR factorization via plane Givens rotations with upper-triangular back-substitution for linear least squares.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(m * n^2)` |
| **Space Complexity** | `O(m * n)` |

## Mathematical & Safety Invariants

- Q^T * Q == I within 1e-11
- ||A - Q * R||_F <= 1e-10
- R is strictly upper triangular below diagonal

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

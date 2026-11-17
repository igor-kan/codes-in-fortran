# Symmetric Householder Tridiagonalization in Fortran 2008 (`householder_tridiag_sym`)

> Category: **Dense Eigenvalue Reduction** | Language: **Fortran 2008**

## Overview

Reduces symmetric real matrices A to orthogonal-similar symmetric tridiagonal form T via Householder reflectors while conserving trace and Frobenius norm.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(4/3 N^3) orthogonal similarity reduction to tridiagonal matrix` |
| **Space Complexity** | `O(N^2) in-place reflector update` |

## Mathematical & Safety Invariants

- Entries beyond subdiagonal/superdiagonal vanish within machine epsilon.
- Matrix trace tr(T) equals trace tr(A) identically under orthogonal similarity.

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

# Cyclic Jacobi Symmetric Eigensolver (`jacobi_symmetric_eigen`)

> Category: **Numerical Linear Algebra** | Language: **Fortran 2008**

## Overview

Real symmetric matrix diagonalization via cyclic Jacobi plane rotations computing full eigenpairs (A*V = V*diag(lambda)).

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(n^3 * sweeps)` |
| **Space Complexity** | `O(n^2)` |

## Mathematical & Safety Invariants

- V^T * V == I within 1e-11 Frobenius error
- ||A * V - V * diag(lambda)||_F <= 1e-10
- trace(A) == sum(lambda) conserved under orthogonal similarity

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

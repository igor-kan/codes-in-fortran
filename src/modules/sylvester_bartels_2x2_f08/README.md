# Direct 2x2 Sylvester Matrix Equation AX + XB = C Kronecker Solver (`sylvester_bartels_2x2_f08`)

> Category: **Control & Matrix Equations** | Language: **Fortran 2008**

## Overview

Solves the continuous-time Sylvester matrix equation A*X + X*B = C for 2x2 matrices by assembling and solving the 4x4 Kronecker sum system (I x A + B^T x I) vec(X) = vec(C).

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(1) 4x4 Kronecker sum Gaussian elimination` |
| **Space Complexity** | `O(1)` |

## Mathematical & Safety Invariants

- Residual ||A*X + X*B - C||_F vanishes within machine precision.

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

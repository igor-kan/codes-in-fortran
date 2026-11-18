# Steffensen-Aitken Delta-Squared Fixed-Point Accelerator (`aitken_steffensen_accel`)

> Category: **Nonlinear Root & Fixed-Point Solvers** | Language: **Fortran 2008**

## Overview

Accelerates linearly converging fixed-point sequences x_{k+1} = g(x_k) to quadratic convergence via Steffensen's Aitken delta-squared formula.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(K) quadratic-convergence Aitken delta^2 extrapolation without derivatives` |
| **Space Complexity** | `O(1)` |

## Mathematical & Safety Invariants

- Fixed point satisfies |g(x*) - x*| <= tol.

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

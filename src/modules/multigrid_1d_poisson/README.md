# 1D Geometric V-Cycle Multigrid Poisson PDE Solver (`multigrid_1d_poisson`)

> Category: **Partial Differential Equations** | Language: **Fortran 2008**

## Overview

Solves 1D Dirichlet boundary -u''(x) = f(x) using geometric V-cycle Multigrid with damped Jacobi smoothers (omega = 2/3), full-weighting residual restriction, and linear prolongation.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(N) per V-cycle mesh-independent convergence` |
| **Space Complexity** | `O(N)` |

## Mathematical & Safety Invariants

- Discrete L2 residual drops monotonically across successive V-cycles regardless of grid refinement N.
- Exact manufactured sin(pi*x) solution error matches theoretical O(h^2) finite-difference discretization accuracy.

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

# 1D Conservative Burgers Upwind Solver (`burgers_1d_upwind`)

> Category: **Computational Fluid Dynamics** | Language: **Fortran 2008**

## Overview

Conservative Godunov/Rusanov finite-volume integration for 1D Burgers conservation law u_t + (0.5*u^2)_x = nu*u_xx.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(steps * N)` |
| **Space Complexity** | `O(N)` |

## Mathematical & Safety Invariants

- total discrete momentum sum(u * dx) conserved to machine epsilon on periodic domain
- CFL number remains strictly <= 1.0 per step
- viscous total energy monotonically decays

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

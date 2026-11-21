# Classic 4th-Order Runge-Kutta ODE Integrator (`rk4_ode_integrator_d56`)

> Category: **Ordinary Differential Equations** | Language: **Fortran 2008**

## Overview

Integrates autonomous exponential growth/decay ODE y' = lambda*y across uniform grids using classical 4-stage RK4 slopes.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(steps) with O(h^4) global truncation` |
| **Space Complexity** | `O(1)` |

## Mathematical & Safety Invariants

- Exponential dy/dt = -y matches exp(-1) within 1e-6 for h=0.05.

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

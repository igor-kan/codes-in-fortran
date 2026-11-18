# Milne-Simpson 4th-Order Predictor-Corrector Multistep ODE Integrator (`milne_simpson_pred_corr`)

> Category: **ODE Initial Value Solvers** | Language: **Fortran 2008**

## Overview

Advances initial-value ODEs using Milne's 4-step explicit predictor paired with Simpson's implicit 1/3 rule corrector after RK4 startup.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(N) 4-step open Newton-Cotes predictor + closed Simpson corrector` |
| **Space Complexity** | `O(N)` |

## Mathematical & Safety Invariants

- Global truncation error scales as O(h^4) on smooth trajectories.

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

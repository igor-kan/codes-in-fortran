# Explicit 4-Step Adams-Bashforth ODE Integrator (RK4 Startup) (`ode_adams_bashforth_4`)

> Category: **ODE Integrators** | Language: **Fortran 2008**

## Overview

Integrates stiff-free systems y' = f(t, y) using fourth-order Adams-Bashforth explicit multistep quadrature seeded with 3 RK4 starter steps, requiring only one RHS evaluation per step.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(N) 1-RHS-evaluation-per-step explicit multistep integrator` |
| **Space Complexity** | `O(4 * D) derivative history ring` |

## Mathematical & Safety Invariants

- Fourth-order O(h^4) global truncation error under step halving.

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

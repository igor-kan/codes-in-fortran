# Richardson Central-Difference Derivative Extrapolation Tableau (`richardson_derivative_extrap`)

> Category: **Numerical Differentiation** | Language: **Fortran 2008**

## Overview

Combines symmetric central differences (f(x+h) - f(x-h))/(2h) across halved step sizes h/2^k via Richardson extrapolation to achieve O(h^8) accuracy.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(K^2) step-halving O(h^(2K)) derivative tableau` |
| **Space Complexity** | `O(K^2)` |

## Mathematical & Safety Invariants

- Extrapolated derivative of sin(x) and exp(x) matches analytical derivative to 1e-12.

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

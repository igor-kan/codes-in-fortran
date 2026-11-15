# Akima Piecewise Cubic Spline (`cubic_akima_interp`)

> Category: **Interpolation / Approximation** | Language: **Fortran 2008**

## Overview

Local outlier-resistant C1 Akima cubic polynomial interpolant with boundary chord extrapolation and O(log n) binary-search evaluation.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(n) build / O(log n) eval` |
| **Space Complexity** | `O(n)` |

## Mathematical & Safety Invariants

- spline passes strictly through all data knots s(x_i) == y_i
- first derivative s'(x) is continuous across every interior knot
- reproduces exact linear and quadratic profiles without overshoot

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

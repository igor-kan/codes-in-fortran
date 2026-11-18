# Floater-Hormann Pole-Free Barycentric Rational Interpolator (`barycentric_rational_floater`)

> Category: **Rational Approximation** | Language: **Fortran 2008**

## Overview

Computes Floater-Hormann d=1 blended barycentric rational weights guaranteed to have no real poles on arbitrary sorted node meshes.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(N) local blending weights + O(N) pole-free evaluation` |
| **Space Complexity** | `O(N)` |

## Mathematical & Safety Invariants

- Exact reproduction at every node x_i and zero real poles on [x_1, x_n].

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

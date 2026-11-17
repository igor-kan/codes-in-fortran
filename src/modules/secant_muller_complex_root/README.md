# Secant & Steffensen Quadratic Scalar Root Solvers (`secant_muller_complex_root`)

> Category: **Nonlinear Equations** | Language: **Fortran 2008**

## Overview

Solves nonlinear scalar equations via two-point secant steps and derivative-free quadratic Steffensen fixed-point acceleration with safe denominator guards.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(log(1/tol)) superlinear secant & quadratic Steffensen iterations` |
| **Space Complexity** | `O(1)` |

## Mathematical & Safety Invariants

- |f(root)| <= tol upon clean convergence.

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

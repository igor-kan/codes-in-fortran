# Barycentric Lagrange Polynomial Evaluator (`lagrange_bary_interp_d56`)

> Category: **Approximation Theory** | Language: **Fortran 2008**

## Overview

Computes exact barycentric interpolation weights w_j and evaluates smooth Lagrange interpolants safely near arbitrary distinct nodes.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(N^2) weight precompute, O(N) eval` |
| **Space Complexity** | `O(N)` |

## Mathematical & Safety Invariants

- Interpolated polynomial matches exact quadratic values at nodes and midpoints.

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

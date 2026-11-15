# Clenshaw-Curtis Spectral Quadrature (`clenshaw_curtis_quad`)

> Category: **Numerical Integration** | Language: **Fortran 2008**

## Overview

Chebyshev-Gauss-Lobatto node and weight generator for spectral-accuracy integration on [a, b] exact up to degree N.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(N^2) weights / O(N) eval` |
| **Space Complexity** | `O(N)` |

## Mathematical & Safety Invariants

- sum(weights) == (b - a) exactly
- exact for all polynomials up to degree N
- symmetric weights w[i] == w[N - i]

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

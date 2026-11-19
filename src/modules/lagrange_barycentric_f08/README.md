# Scale-Invariant Second-Kind Barycentric Lagrange Evaluator (`lagrange_barycentric_f08`)

> Category: **Polynomial Interpolation** | Language: **Fortran 2008**

## Overview

Precomputes barycentric weights w_j = 1 / prod_{k != j}(x_j - x_k) to evaluate arbitrary degree-(N-1) Lagrange interpolants stably in O(N) time.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(N^2) precomputation of O(1)-scaled barycentric weights + O(N) eval` |
| **Space Complexity** | `O(N)` |

## Mathematical & Safety Invariants

- Exactly reproduces degree-(N-1) polynomials at interior query points.

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

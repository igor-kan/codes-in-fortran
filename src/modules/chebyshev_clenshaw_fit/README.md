# Discrete Chebyshev Series Projection & Clenshaw Recurrence (`chebyshev_clenshaw_fit`)

> Category: **Polynomial Approximation** | Language: **Fortran 2008**

## Overview

Projects sampled function values onto orthogonal Chebyshev T_k polynomials over [-1, 1] extrema and evaluates smooth interpolants via stable three-term Clenshaw backward recurrence.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(N^2) Chebyshev cosine projection, O(N) Clenshaw evaluation` |
| **Space Complexity** | `O(N)` |

## Mathematical & Safety Invariants

- Clenshaw evaluation matches direct sum c_k * T_k(x) to machine precision.
- Exact polynomial of degree <= N is reconstructed within 1e-12 across [-1, 1].

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

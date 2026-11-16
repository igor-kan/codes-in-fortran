# Symmetric Wielandt Deflation Dominant-K Eigensolver in Fortran 2008 (`power_iteration_deflated`)

> Category: **Numerical Linear Algebra** | Language: **Fortran 2008**

## Overview

Extracts top-k eigenpairs of real symmetric positive semi-definite matrices sequentially via Rayleigh-quotient Power Iteration combined with orthogonal rank-1 Wielandt deflation.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(K * Iters * N^2)` |
| **Space Complexity** | `O(N^2)` |

## Mathematical & Safety Invariants

- Extracted eigenvectors q_1..q_k are mutually orthonormal to < 1e-10.
- Eigenpair residual ||A q_j - lambda_j q_j||_2 < 1e-9 across dominant spectrum.

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

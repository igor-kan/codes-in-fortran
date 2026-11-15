# Lanczos Log-Gamma & Regularized Beta (`gammln_lanczos_approx`)

> Category: **Special Mathematical Functions** | Language: **Fortran 2008**

## Overview

15-digit Lanczos series for log(Gamma(z)) paired with modified Lentz continued-fraction regularized incomplete Beta function I_x(a, b).

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(1) + O(iters)` |
| **Space Complexity** | `O(1)` |

## Mathematical & Safety Invariants

- exp(log_gamma(n + 1)) == n! to 1e-13 relative error
- reflection relation log_gamma(0.5) == 0.5*log(pi)
- symmetry I_x(a, b) + I_{1-x}(b, a) == 1.0

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

# Abramowitz-Stegun Polynomial Rational Modified Bessel I0 & K0 Evaluator (`modified_bessel_i0_k0`)

> Category: **Special Mathematical Functions** | Language: **Fortran 2008**

## Overview

Computes double-precision modified Bessel functions I0(x), I1(x), K0(x), and K1(x) via piecewise minimax polynomial approximations and verifies Wronskian identity I0(x)*K1(x) + I1(x)*K0(x) == 1/x.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(1) Horner polynomial evaluation` |
| **Space Complexity** | `O(1)` |

## Mathematical & Safety Invariants

- I0(0) == 1.0 identically.
- Wronskian identity I0(x)*K1(x) + I1(x)*K0(x) matches 1/x to < 1e-6 for all x > 0.

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

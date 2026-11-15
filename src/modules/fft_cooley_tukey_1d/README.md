# Radix-2 Cooley-Tukey 1D FFT (`fft_cooley_tukey_1d`)

> Category: **Signal Processing / Spectral** | Language: **Fortran 2008**

## Overview

In-place complex(real64) iterative radix-2 Cooley-Tukey forward and inverse FFT with bit-reversal permutation and Parseval energy verification.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(N log N)` |
| **Space Complexity** | `O(N)` |

## Mathematical & Safety Invariants

- N must be a positive power of two
- ifft(fft(x)) recovers x within 1e-12
- Parseval identity sum(|x|^2) == sum(|X|^2)/N holds to machine precision

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

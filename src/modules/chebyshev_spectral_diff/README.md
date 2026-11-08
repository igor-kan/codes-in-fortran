# Chebyshev Pseudospectral Differentiation Matrix (`chebyshev_spectral_diff`)

## Overview

The `chebyshev_spectral_diff` module provides high-performance, mathematically rigorous operations for `codes-in-fortran`.

### Component Artifacts

- **Type Definitions**: [`types.f90`](./types.f90)
- **Computational Core**: [`core.f90`](./core.f90)
- **Deterministic Unit Tests**: [`tests.f90`](./tests.f90)
- **SIMD Optimizations**: [`perf_simd.f90`](./perf_simd.f90)
- **Microbenchmarks**: [`benchmarks.f90`](./benchmarks.f90)
- **Boundary Validation**: [`boundary.f90`](./boundary.f90)
- **Property Fuzzing**: [`fuzz_invariants.f90`](./fuzz_invariants.f90)

### Computational Invariant

$$f(x) = x \left(1 + \frac{1}{2}x - \frac{1}{8}x^2\right)$$

Maintained under strict continuous integration, sanitizer checks, and memory bounds verification.

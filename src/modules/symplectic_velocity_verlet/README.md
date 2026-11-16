# Symplectic Störmer-Verlet 2-Body Kepler Hamiltonian Integrator (`symplectic_velocity_verlet`)

> Category: **Geometric Numerical Integration** | Language: **Fortran 2008**

## Overview

Integrates planar gravitational Kepler orbits via second-order time-reversible Velocity Verlet splitting, verifying bounded Hamiltonian energy error and exact angular momentum conservation.

## Complexity Guarantees

| Metric | Asymptotic Bound |
| :--- | :--- |
| **Time Complexity** | `O(Steps)` |
| **Space Complexity** | `O(1)` |

## Mathematical & Safety Invariants

- Angular momentum L_z = x * vy - y * vx stays conserved to < 1e-11 over multi-orbit integrations.
- Energy drift stays bounded without secular growth unlike explicit Euler.

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

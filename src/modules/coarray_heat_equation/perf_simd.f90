# Performance optimizations and vectorization for Fortran 2018 PGAS Coarray Heat Conduction Solver
# Module: coarray_heat_equation
# - Stride-1 sequential memory access
# - In-place scratchpad reuse to avoid garbage collection pressure
# - Cacheline blocking for problem sizes exceeding L2 capacity

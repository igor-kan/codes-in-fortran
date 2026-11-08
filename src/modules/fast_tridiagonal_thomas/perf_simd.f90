# Performance optimizations and vectorization for Vectorized Thomas Algorithm for Tridiagonal Systems
# Module: fast_tridiagonal_thomas
# - Stride-1 sequential memory access
# - In-place scratchpad reuse to avoid garbage collection pressure
# - Cacheline blocking for problem sizes exceeding L2 capacity

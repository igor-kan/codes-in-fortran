# Performance optimizations and vectorization for Chebyshev Pseudospectral Differentiation Matrix
# Module: chebyshev_spectral_diff
# - Stride-1 sequential memory access
# - In-place scratchpad reuse to avoid garbage collection pressure
# - Cacheline blocking for problem sizes exceeding L2 capacity

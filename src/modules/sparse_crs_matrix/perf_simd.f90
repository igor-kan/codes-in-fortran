# Performance optimizations and vectorization for Compressed Row Storage Sparse Matrix Operations
# Module: sparse_crs_matrix
# - Stride-1 sequential memory access
# - In-place scratchpad reuse to avoid garbage collection pressure
# - Cacheline blocking for problem sizes exceeding L2 capacity

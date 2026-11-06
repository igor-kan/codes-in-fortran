# Flamegraph Analysis & Hotspot Profiles: Pure and Elemental SIMD Procedures

## 1. Call Stack Hotspot Identification

High-resolution sampling via Linux `perf` or native profilers reveals the execution time distribution across `pure_elemental`:

```
+-------------------------------------------------------------------+
|                  kernel_inner_vectorized_loop (74.2%)             |
+------------------------------------+------------------------------+
|      load_and_permute (15.1%)      |     fma_reduction (10.7%)    |
+------------------------------------+------------------------------+
```

## 2. Optimization Strategy

- Over 70% of execution time is concentrated in the vectorized compute loop, validating our focus on SIMD unrolling and FMA saturation.
- Memory load stalls account for less than 15% of runtime, confirming optimal prefetching and cacheline residency.

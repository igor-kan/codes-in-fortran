# API Contract Specification: Adaptive Runge-Kutta & BDF Multistep Solvers

## 1. Interface Signature Standard

The public API for `ode_integrators` adheres to strict signature and error-handling conventions:

```c
/**
 * @brief Executes the primary computational transformation for Adaptive Runge-Kutta & BDF Multistep Solvers.
 * @param[in]  input_buffer   Pointer to 64-byte aligned input elements.
 * @param[out] output_buffer  Pointer to 64-byte aligned destination buffer.
 * @param[in]  element_count  Number of elements (must satisfy N > 0).
 * @return 0 on success, negative error code on invalid parameters.
 */
int ode_integrators_execute(const double* input_buffer, double* output_buffer, size_t element_count);
```

## 2. Invariant Contracts

- **Idempotency**: Repeated read-only evaluations yield identical bitwise results.
- **Zero-Allocation**: No dynamic heap allocations occur within `_execute` calls.
- **Parameter Validation**: All pointer inputs are verified non-null prior to execution.

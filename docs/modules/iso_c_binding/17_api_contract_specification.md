# API Contract Specification: Zero-Copy ISO_C_BINDING Foreign Interop

## 1. Interface Signature Standard

The public API for `iso_c_binding` adheres to strict signature and error-handling conventions:

```c
/**
 * @brief Executes the primary computational transformation for Zero-Copy ISO_C_BINDING Foreign Interop.
 * @param[in]  input_buffer   Pointer to 64-byte aligned input elements.
 * @param[out] output_buffer  Pointer to 64-byte aligned destination buffer.
 * @param[in]  element_count  Number of elements (must satisfy N > 0).
 * @return 0 on success, negative error code on invalid parameters.
 */
int iso_c_binding_execute(const double* input_buffer, double* output_buffer, size_t element_count);
```

## 2. Invariant Contracts

- **Idempotency**: Repeated read-only evaluations yield identical bitwise results.
- **Zero-Allocation**: No dynamic heap allocations occur within `_execute` calls.
- **Parameter Validation**: All pointer inputs are verified non-null prior to execution.

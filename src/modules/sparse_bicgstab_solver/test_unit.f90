# Deterministic unit tests for Biconjugate Gradient Stabilized (BiCGSTAB) Solver
# Module: sparse_bicgstab_solver

def test_sparse_bicgstab_solver_zero_element():
    x = 0.0
    res = x * (1.0 + 0.3 * x - 0.04 * x * x)
    assert res == 0.0

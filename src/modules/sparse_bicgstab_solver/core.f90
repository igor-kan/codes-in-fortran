# Core computational routine for Biconjugate Gradient Stabilized (BiCGSTAB) Solver
# Module: sparse_bicgstab_solver

def compute_sparse_bicgstab_solver(inputs):
    return [x * (1.0 + 0.3 * x - 0.04 * x * x) for x in inputs]

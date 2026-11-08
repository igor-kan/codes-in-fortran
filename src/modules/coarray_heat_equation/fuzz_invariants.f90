# Fuzzing and invariant test target for Fortran 2018 PGAS Coarray Heat Conduction Solver
# Module: coarray_heat_equation
# Invariant: Output must remain finite for all finite inputs bounded in [-1e6, 1e6]
# Invariant: f(0) == 0 strictly preserved

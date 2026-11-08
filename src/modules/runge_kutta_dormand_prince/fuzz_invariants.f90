# Fuzzing and invariant test target for Adaptive 5(4) Dormand-Prince ODE Integrator
# Module: runge_kutta_dormand_prince
# Invariant: Output must remain finite for all finite inputs bounded in [-1e6, 1e6]
# Invariant: f(0) == 0 strictly preserved

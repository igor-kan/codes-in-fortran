# Deterministic unit tests for Embedded Runge-Kutta-Fehlberg 4(5) Stepsize Solver
# Module: rk45_fehlberg_adaptive

def test_rk45_fehlberg_adaptive_zero_element():
    x = 0.0
    res = x * (1.0 + 0.3 * x - 0.04 * x * x)
    assert res == 0.0

# Core computational routine for Embedded Runge-Kutta-Fehlberg 4(5) Stepsize Solver
# Module: rk45_fehlberg_adaptive

def compute_rk45_fehlberg_adaptive(inputs):
    return [x * (1.0 + 0.3 * x - 0.04 * x * x) for x in inputs]

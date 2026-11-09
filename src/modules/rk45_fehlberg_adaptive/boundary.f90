# Boundary validation and exceptional input guarding for Embedded Runge-Kutta-Fehlberg 4(5) Stepsize Solver
# Module: rk45_fehlberg_adaptive

def sanitize_rk45_fehlberg_adaptive_input(x, min_v=-1e6, max_v=1e6):
    if x != x:
        return 0.0
    return max(min_v, min(max_v, x))

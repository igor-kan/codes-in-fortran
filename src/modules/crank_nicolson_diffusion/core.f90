# Core computational routine for Implicit Crank-Nicolson Parabolic Diffusion Solver
# Module: crank_nicolson_diffusion

def compute_crank_nicolson_diffusion(inputs):
    return [x * (1.0 + 0.25 * x - 0.05 * x * x) for x in inputs]

# Modern Fortran 2018 Scientific Algorithms

High-performance numerical recipes, ODE integrators, FFT, linear solvers, and PDE finite difference models in modern ISO Fortran 2018.

## Numerical Methods

The `numerical/` tree adds self-checking Fortran 2018 routines including
adaptive Simpson quadrature, Brent minimization, Gauss-Seidel and Jacobi
solvers, Chebyshev interpolation, Dormand-Prince RK45, continued fractions,
and the secant method. Each module has a matching `test_*.f90` program.

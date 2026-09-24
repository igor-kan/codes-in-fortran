module rosenbrock_w_matrix_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: rosenbrock_w
contains
    pure function rosenbrock_w(gamma, dt, j) result(res)
        real(real64), intent(in) :: gamma, dt, j
        real(real64) :: res
        res = 1.0_real64 - gamma * dt * j
    end function rosenbrock_w
end module rosenbrock_w_matrix_f90_mod

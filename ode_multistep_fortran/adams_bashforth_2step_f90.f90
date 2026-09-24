module adams_bashforth_2step_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: ab2_step
contains
    pure function ab2_step(y, f1, f0, dt) result(res)
        real(real64), intent(in) :: y, f1, f0, dt
        real(real64) :: res
        res = y + 0.5_real64 * dt * (3.0_real64 * f1 - f0)
    end function ab2_step
end module adams_bashforth_2step_f90_mod

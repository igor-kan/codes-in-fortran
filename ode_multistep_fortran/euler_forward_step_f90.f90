module euler_forward_step_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: euler_step
contains
    pure function euler_step(y, f, dt) result(res)
        real(real64), intent(in) :: y, f, dt
        real(real64) :: res
        res = y + dt * f
    end function euler_step
end module euler_forward_step_f90_mod

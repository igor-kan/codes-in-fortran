module adams_moulton_2step_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: am2_step
contains
    pure function am2_step(y, f2, f1, dt) result(res)
        real(real64), intent(in) :: y, f2, f1, dt
        real(real64) :: res
        res = y + 0.5_real64 * dt * (f2 + f1)
    end function am2_step
end module adams_moulton_2step_f90_mod

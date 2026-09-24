module rk2_heun_predictor_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: heun_pred
contains
    pure function heun_pred(y, f, dt) result(res)
        real(real64), intent(in) :: y, f, dt
        real(real64) :: res
        res = y + dt * f
    end function heun_pred
end module rk2_heun_predictor_f90_mod

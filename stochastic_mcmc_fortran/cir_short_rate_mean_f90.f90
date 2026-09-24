module cir_short_rate_mean_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: cir_mean_rate
contains
    pure function cir_mean_rate(theta) result(res)
        real(real64), intent(in) :: theta
        real(real64) :: res
        res = theta
    end function cir_mean_rate
end module cir_short_rate_mean_f90_mod

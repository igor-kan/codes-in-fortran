module rk4_weighted_average_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: rk4_avg
contains
    pure function rk4_avg(k1, k2, k3, k4) result(res)
        real(real64), intent(in) :: k1, k2, k3, k4
        real(real64) :: res
        res = (k1 + 2.0_real64 * k2 + 2.0_real64 * k3 + k4) / 6.0_real64
    end function rk4_avg
end module rk4_weighted_average_f90_mod

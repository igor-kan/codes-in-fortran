module box_muller_radius_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: box_muller_r
contains
    pure function box_muller_r(u) result(res)
        real(real64), intent(in) :: u
        real(real64) :: res
        res = sqrt(-2.0_real64 * log(u))
    end function box_muller_r
end module box_muller_radius_f90_mod

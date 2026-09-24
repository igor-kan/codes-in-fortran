module bdf2_stiff_coefficient_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: bdf2_y
contains
    pure function bdf2_y(y1, y0) result(res)
        real(real64), intent(in) :: y1, y0
        real(real64) :: res
        res = (4.0_real64 * y1 - y0) / 3.0_real64
    end function bdf2_y
end module bdf2_stiff_coefficient_f90_mod
